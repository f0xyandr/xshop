import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../repositories/products/models/models.dart';
import '../../../repositories/products/products_repository.dart';
import '../../../router/router.dart';
import '../cart.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartBloc = CartBloc(GetIt.I<ProductsRepository>());
  final List<CartItem> _selectedItems = []; // Хранит id выбранных товаров

  @override
  void initState() {
    super.initState();
    _cartBloc.add(LoadCartItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          if (_selectedItems.isNotEmpty) // Показываем кнопку только при выборе
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {
                      AutoRouter.of(context)
                          .push(CheckoutRoute(cartItems: _selectedItems));
                    },
                    child: const Text("Заказать")),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    final userId =
                        Supabase.instance.client.auth.currentUser!.id;
                    final thrashList = [
                      for (var i in _selectedItems) i.product.id
                    ];
                    // Отправляем событие для удаления выбранных товаров
                    _cartBloc.add(DeleteCartItems(
                      userId: userId,
                      productIds: thrashList,
                    ));

                    // Очищаем выбор после удаления
                    setState(() {
                      _selectedItems.clear();
                    });
                    debugPrint("$thrashList");
                  },
                ),
              ],
            ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        bloc: _cartBloc,
        builder: (context, state) {
          if (state is CartLoaded) {
            final cartItemsList = state.cartItemsList;
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cartItemsList.length,
              itemBuilder: (context, index) {
                final cartItem = cartItemsList[index];
                final isSelected = _selectedItems.contains(cartItem);

                return ListTile(
                  title: Text(cartItem.product.name),
                  subtitle: Text("Количество: ${cartItem.quantity}"),
                  trailing: Text(
                      "Цена: ${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}"),
                  leading: Checkbox(
                    value: isSelected,
                    onChanged: (selected) {
                      setState(() {
                        if (selected == true) {
                          _selectedItems.add(cartItem);
                        } else {
                          _selectedItems.remove(cartItem);
                        }
                      });
                    },
                  ),
                );
              },
            );
          }

          if (state is CartLoadingFailure) {
            return Center(child: Text("Error: ${state.e} \n ${state.st}"));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
