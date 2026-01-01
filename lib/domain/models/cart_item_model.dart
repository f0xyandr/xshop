import 'package:xshop/data/entity/cart_item_entity.dart';
import 'package:xshop/domain/models/product_model.dart';

class CartItemModel {
  final int productId;
  final int quantity;

  CartItemModel({required this.productId, required this.quantity});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModel &&
          runtimeType == other.runtimeType &&
          productId == other.productId &&
          quantity == other.quantity;

  @override
  int get hashCode => productId.hashCode ^ quantity.hashCode;

  factory CartItemModel.fromEntity(CartItemEntity e) =>
      CartItemModel(productId: e.productId, quantity: e.quantity);
}
