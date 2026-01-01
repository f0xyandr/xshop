import 'package:xshop/data/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.categoryName,
    required super.createdAt,
  });

  factory CategoryModel.fromEntity(CategoryEntity e) => CategoryModel(
    id: e.id,
    categoryName: e.categoryName,
    createdAt: e.createdAt,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          categoryName == other.categoryName &&
          createdAt == other.createdAt;

  @override
  int get hashCode => id.hashCode ^ categoryName.hashCode ^ createdAt.hashCode;
}
