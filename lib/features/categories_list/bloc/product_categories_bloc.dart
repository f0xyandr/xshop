import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/products/abstract_products_repository.dart';
import '../../../repositories/products/models/models.dart';

part 'product_categories_event.dart';
part 'product_categories_state.dart';

class ProductCategoriesBloc
    extends Bloc<ProductCategoriesEvent, ProductCategoriesState> {
  ProductCategoriesBloc(this.productsRepository)
      : super(ProductCategoriesInitial()) {
    on<LoadProductCategories>((event, emit) async {
      try {
        if (state is! ProductCategoriesLoaded) {
          emit(const ProductCategoriesLoading());
        }
        final productCategoriesList =
            await productsRepository.getProductCategoryList();
        emit(ProductCategoriesLoaded(
            productCategoriesList: productCategoriesList));
      } catch (e, st) {
        emit(ProductCategoriesLoadingFailure(exception: e, st: st));
      }
    });
  }
  final AbstractProductsRepository productsRepository;
}
