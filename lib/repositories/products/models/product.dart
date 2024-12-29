class Product {
  final String name;
  final int price;
  final int id;
  final int? discount;
  final Map? specification;
  final String? imageUrl;
  final String? description;

  num priceWithDiscount() {
    return price - (price * (discount ?? 0) / 100);
  }

  Product({
    this.specification,
    required this.name,
    required this.price,
    required this.id,
    this.discount,
    this.imageUrl,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      specification: json['specification'],
      id: json['id'],
      name: json['name'],
      price: json['price'],
      discount: json['discount_percent'],
      imageUrl: json['image_url'],
      description: json['description'],
    );
  }
}
