import 'package:equatable/equatable.dart';

import '../../../domain/models/product_model.dart';

class CartItemDisplayModel extends Equatable {
  final ProductModel product;
  final int quantity;

  const CartItemDisplayModel({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [product, quantity];
}
