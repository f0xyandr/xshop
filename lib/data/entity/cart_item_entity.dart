class CartItemEntity {
  final int productId;
  final int quantity;

  CartItemEntity({
    required this.productId,
    required this.quantity,
  });

  factory CartItemEntity.fromJson(json) {
    return CartItemEntity(
      productId: json['product_id'],
      quantity: json['quantity'],
    );
  }
}
