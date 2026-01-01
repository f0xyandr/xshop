class ProductListEntity {
  final String title;
  final int price;
  final int id;
  final int? discount;
  final String? imageUrl;

  ProductListEntity({
    required this.title,
    required this.price,
    required this.id,
    this.discount,
    this.imageUrl,
  });

  factory ProductListEntity.fromJson(json) {
    return ProductListEntity(
      title: json['title'],
      price: json['price'],
      id: json['id'],
    );
  }
}
