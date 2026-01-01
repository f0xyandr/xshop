class CategoryEntity {
  final String id;
  final String categoryName;
  final String createdAt;

  CategoryEntity({
    required this.id,
    required this.categoryName,
    required this.createdAt,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
    id: json['id'],
    categoryName: json['category_name'],
    createdAt: json['created_at'],
  );
}
