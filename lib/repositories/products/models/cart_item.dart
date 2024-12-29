import 'package:online_shop/repositories/products/models/models.dart';

class CartItem {
  const CartItem({required this.product, required this.quantity});
  final Product product;
  final int quantity;
}
