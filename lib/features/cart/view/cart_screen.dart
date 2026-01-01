import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/domain/models/cart_item_display_model.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';
import 'package:xshop/features/cart/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartBloc = CartBloc(
    productRepository: GetIt.I.get<ProductAbstractRepository>(),
    cartRepository: GetIt.I.get<CartAbstractRepository>(),
  );
  final List<CartItemDisplayModel> _selectedItems =
      []; // Хранит id выбранных товаров

  @override
  void initState() {
    super.initState();
    _cartBloc.add(LoadCart());
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
                OutlinedButton(onPressed: () {}, child: const Text("Заказать")),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.black),
                  onPressed: () {
                    // Отправляем событие для удаления выбранных товаров
                    // _cartBloc.add(DeleteCartItems(
                    //   userId: userId,
                    //   productIds: thrashList,
                    // ));

                    // Очищаем выбор после удаления
                    setState(() {
                      _selectedItems.clear();
                    });
                    // debugPrint("$thrashList");
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
            final cartItemsList = state.cartItems;
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cartItemsList.length,
              itemBuilder: (context, index) {
                final cartItem = cartItemsList[index];
                final isSelected = _selectedItems.contains(cartItem);

                return ListTile(
                  title: Text(cartItem.product.title),
                  subtitle: Text("Количество: ${cartItem.quantity}"),
                  trailing: Text(
                    "Цена: ${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}",
                  ),
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

          if (state is CartError) {
            return Center(child: Text("Error: ${state.e} \n ${state.st}"));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
