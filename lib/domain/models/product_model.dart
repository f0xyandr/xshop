import 'package:flutter/foundation.dart';
import 'package:xshop/data/entity/product_entity.dart';

class ProductModel {
  final String title;
  final int price;
  final int id;
  final String categoryId;
  final int? discount;
  final String? imageUrl;
  final String? description;
  final Map specification;

  ProductModel({
    required this.title,
    required this.price,
    required this.id,
    required this.categoryId,
    required this.specification,
    this.discount,
    this.imageUrl,
    this.description,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      title: json['title'],
      price: json['price'],
      id: json['id'],
      categoryId: json['category_id'],
      specification: json['specs'],
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      categoryId: entity.categoryId,
      specification: entity.specification,
      discount: entity.discount,
      description: entity.description,
      imageUrl: entity.imageUrl,
    );
  }

  int priceWithDiscount() {
    return (price - (price * (discount ?? 0) / 100)).toInt();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          price == other.price &&
          id == other.id &&
          categoryId == other.categoryId &&
          discount == other.discount &&
          imageUrl == other.imageUrl &&
          description == other.description &&
          mapEquals(specification, other.specification);

  @override
  int get hashCode =>
      title.hashCode ^
      price.hashCode ^
      id.hashCode ^
      categoryId.hashCode ^
      discount.hashCode ^
      imageUrl.hashCode ^
      description.hashCode ^
      specification.hashCode;
}
