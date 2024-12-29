import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/products/abstract_products_repository.dart';
import '../../../repositories/products/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.productsRepository) : super(ProductInitial()) {
    on<LoadProduct>(_loadProduct);
  }
  _loadProduct(LoadProduct event, Emitter<ProductState> emit) async {
    try {
      if (state is! ProductLoaded) emit(const ProductLoading());
      final productList =
          await productsRepository.getProductList(event.categoryId);
      emit(ProductLoaded(productList: productList));
    } catch (e, st) {
      emit(ProductLoadingFailure(exception: e, st: st));
    }
  }

  final AbstractProductsRepository productsRepository;
}
