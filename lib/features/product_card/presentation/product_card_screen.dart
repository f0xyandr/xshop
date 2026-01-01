// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:xshop/domain/models/product_model.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';
import 'package:xshop/features/product_card/presentation/bloc/product_card_bloc.dart';
import 'package:xshop/features/product_card/presentation/widgets/description.dart';

class ProductCardScreen extends StatefulWidget {
  const ProductCardScreen({
    super.key,
    required this.productId,
    required this.title,
  });

  final int productId;
  final String title;

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  final _productCardBloc = ProductCardBloc(
    productsRepository: GetIt.I<ProductAbstractRepository>(),
    cartRepository: GetIt.I<CartAbstractRepository>(),
  );

  @override
  void initState() {
    _productCardBloc.add(LoadProductCard(widget.productId));
    debugPrint("${widget.productId}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCardBloc, ProductCardState>(
        bloc: _productCardBloc,
        builder: (context, state) {
          final theme = Theme.of(context);
          if (state is ProductCardLoaded) {
            final ProductModel product = state.product;
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(height: 250, color: Colors.grey), // Product Name
                  Text(state.product.title, style: theme.textTheme.labelMedium),
                  const SizedBox(height: 8),
                  // Product Price
                  state.product.discount == 0
                      ? Row(
                          children: [
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        )
                      : Row(
                          children: [
                            if (state.product.discount != null) ...[
                              Text(
                                '\$${product.priceWithDiscount()}',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '\$${state.product.price}',
                                style: theme.textTheme.headlineMedium,
                              ),
                            ],
                          ],
                        ),
                  const SizedBox(height: 16),
                  DescriptionWidget(cardDescription: state.product.description),

                  const SizedBox(height: 8),

                  state.product.specification.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              "Характеристики:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...state.product.specification.entries.map(
                              (entry) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${entry.key}: ",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${entry.value}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(height: 1),
                  const Expanded(child: SizedBox()),

                  // Add to Cart Button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        _productCardBloc.add(
                          AddProduct(productId: state.product.id),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 8,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text("Добавить в корзину"),
                    ),
                  ),

                  // Navigate to Cart Button
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
