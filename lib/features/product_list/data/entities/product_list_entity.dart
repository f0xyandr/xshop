class ProductListEntity {
  final String title;
  final int price;
  final int id;
  final int? discount;
  final String? imageUrl;
  final String? description;

  ProductListEntity({
    required this.title,
    required this.price,
    required this.id,
    this.discount,
    this.imageUrl,
    this.description,
  });

  factory ProductListEntity.fromJson(json) {
    return ProductListEntity(
      title: json['title'],
      price: json['price'],
      id: json['id'],
      description: json['description'],
    );
  }
}
