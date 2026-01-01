class ProductEntity {
  final String title;
  final int price;
  final int id;
  final String categoryId;
  final int? discount;
  final String? imageUrl;
  final String? description;
  final Map specification;

  ProductEntity({
    required this.title,
    required this.price,
    required this.id,
    required this.categoryId,
    required this.specification,
    this.discount,
    this.imageUrl,
    this.description,
  });

  factory ProductEntity.fromJson(json) {
    return ProductEntity(
      title: json['title'],
      price: json['price'],
      id: json['id'],
      categoryId: json['category_id'],
      specification: json['specs'],
      description: json['description'],
    );
  }
}
