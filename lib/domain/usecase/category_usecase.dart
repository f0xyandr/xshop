import 'package:xshop/domain/models/category_model.dart';
import 'package:xshop/domain/repository/category_repo_interface.dart';

class FetchBaseCategoriesUsecase {
  final CategoryAbstractRepository categoryRepository;

  FetchBaseCategoriesUsecase({required this.categoryRepository});

  Future<List<CategoryModel?>?> call() => categoryRepository.getCategories();
}
