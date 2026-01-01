import 'package:flutter/material.dart';
import 'package:xshop/domain/models/product_list_model.dart';

class ProductTile extends StatelessWidget {
  final ProductListModel product;
  final GestureTapCallback onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Icon(Icons.broken_image),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: product.discount == 0
                  ? Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.green),
                    )
                  : Column(
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: const Color.fromARGB(255, 150, 0, 0),
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        Text(
                          '\$${product.priceWithDiscount().toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: Colors.green),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
