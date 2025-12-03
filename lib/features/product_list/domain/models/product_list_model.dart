import 'package:xshop/features/product_list/data/entities/product_list_entity.dart';

class ProductListModel extends ProductListEntity {
  num priceWithDiscount() {
    return price - (price * (discount ?? 0) / 100);
  }

  ProductListModel({
    required super.id,
    required super.title,
    required super.price,
    super.description,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
    );
  }
  factory ProductListModel.fromEntity(ProductListEntity entity) {
    return ProductListModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      description: entity.description,
    );
  }
}
