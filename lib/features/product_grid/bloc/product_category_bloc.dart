import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xshop/domain/models/category_model.dart';
import 'package:xshop/domain/models/product_model.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProducstWithCategoryBloc
    extends Bloc<ProducstWithCategoryEvent, ProducstWithCategoryState> {
  ProducstWithCategoryBloc(this.productsRepository) : super(ProductInitial()) {
    on<LoadProduct>(_loadProduct);
  }
  _loadProduct(
    LoadProduct event,
    Emitter<ProducstWithCategoryState> emit,
  ) async {
    try {
      if (state is! ProductLoaded) emit(const ProductLoading());
      final productList = await productsRepository.getProductsWithCategory(
        categoryId: event.category.id,
      );
      emit(ProductLoaded(productList: productList!));
    } catch (e, st) {
      emit(ProductLoadingFailure(exception: e, st: st));
    }
  }

  final ProductAbstractRepository productsRepository;
}
