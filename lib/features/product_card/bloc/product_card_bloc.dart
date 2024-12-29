// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/products/models/models.dart';
import '../../../repositories/products/products_repository.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc(this.productsRepository) : super(const ProductCardInitial()) {
    on<LoadProductCard>(_load);
  }
  Future<void> _load(
      LoadProductCard event, Emitter<ProductCardState> state) async {
    try {
      if (state is! ProductCardLoaded) emit(ProductCardLoading());
      final productCard = await productsRepository.getProduct(event.product.id);
      emit(ProductCardLoaded(productCard));
    } catch (e, st) {
      emit(ProductCardLoadingFailure(e: e, st: st));
    }
  }

  ProductsRepository productsRepository;
}
