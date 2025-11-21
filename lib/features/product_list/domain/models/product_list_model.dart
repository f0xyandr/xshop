import 'package:xshop/features/product_list/data/entities/product_list_entity.dart';

class ProductListModel extends ProductListEntity {
  num priceWithDiscount() {
    return price - (price * (discount ?? 0) / 100);
  }

  ProductListModel({
    required super.id,
    required super.name,
    required super.price,
    super.discount,
    super.imageUrl,
    super.description,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      discount: json['discount_percent'],
      imageUrl: json['image_url'],
      description: json['description'],
    );
  }
}
