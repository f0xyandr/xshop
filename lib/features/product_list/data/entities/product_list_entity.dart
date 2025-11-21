class ProductListEntity {
  final String name;
  final int price;
  final int id;
  final int? discount;
  final String? imageUrl;
  final String? description;

  ProductListEntity({
    required this.name,
    required this.price,
    required this.id,
    this.discount,
    this.imageUrl,
    this.description,
  });
}
