import 'package:xshop/domain/models/category_model.dart';

abstract class CategoryAbstractRepository {
  Future<List<CategoryModel?>?> getCategories();
}
