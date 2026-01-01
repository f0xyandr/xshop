import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xshop/domain/models/category_model.dart';
import 'package:xshop/domain/repository/category_repo_interface.dart';
import 'package:xshop/domain/usecase/category_usecase.dart';

part 'product_categories_event.dart';
part 'product_categories_state.dart';

class ProductCategoriesBloc
    extends Bloc<ProductCategoriesEvent, ProductCategoriesState> {
  ProductCategoriesBloc(this.categoryRepository)
    : super(ProductCategoriesInitial()) {
    on<LoadProductCategories>((event, emit) async {
      try {
        if (state is! ProductCategoriesLoaded) {
          emit(const ProductCategoriesLoading());
        }
        final productCategoriesList = await FetchBaseCategoriesUsecase(
          categoryRepository: categoryRepository,
        ).call();

        emit(
          ProductCategoriesLoaded(
            productCategoriesList: productCategoriesList!,
          ),
        );
      } catch (e, st) {
        debugPrint(e.toString());
        emit(ProductCategoriesLoadingFailure(exception: e, st: st));
      }
    });
  }
  final CategoryAbstractRepository categoryRepository;
}
