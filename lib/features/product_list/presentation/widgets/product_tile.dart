import 'package:flutter/material.dart';
import 'package:xshop/features/product_list/domain/models/product_list_model.dart';

class ProductTile extends StatelessWidget {
  final ProductListModel product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image_outlined, size: 40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: product.discount == 0
                  ? Text(
                      '\$${product.price?.toStringAsFixed(2)}',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.green),
                    )
                  : Column(
                      children: [
                        Text(
                          '\$${product.price?.toStringAsFixed(2)}',
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
