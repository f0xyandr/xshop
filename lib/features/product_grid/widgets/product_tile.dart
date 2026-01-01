import 'package:flutter/material.dart';
import 'package:xshop/domain/models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product, required this.onTap});
  final ProductModel? product;
  final GestureTapCallback onTap;
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
            const Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Icon(Icons.broken_image_outlined, size: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  product!.discount == 0
                      ? Text(
                          '\$${product!.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: Colors.green),
                        )
                      : Column(
                          children: [
                            Text(
                              '\$${product!.price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(255, 150, 0, 0),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                            Text(
                              '\$${product!.priceWithDiscount().toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: Colors.green),
                            ),
                          ],
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
