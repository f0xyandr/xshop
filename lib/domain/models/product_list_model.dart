import 'package:xshop/data/entity/product_list_entity.dart';

class ProductListModel extends ProductListEntity {
  int priceWithDiscount() {
    return (price - (price * (discount ?? 0) / 100)).toInt();
  }

  ProductListModel({
    required super.id,
    required super.title,
    required super.price,
    super.discount,
    super.imageUrl,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      discount: json['discount'],
      imageUrl: json['image_url'],
    );
  }
  factory ProductListModel.fromEntity(ProductListEntity entity) {
    return ProductListModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      discount: entity.discount,
      imageUrl: entity.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          price == other.price &&
          id == other.id &&
          discount == other.discount &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      title.hashCode ^
      price.hashCode ^
      id.hashCode ^
      discount.hashCode ^
      imageUrl.hashCode;
}
