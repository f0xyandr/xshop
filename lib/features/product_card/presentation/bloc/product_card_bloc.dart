// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xshop/core/utils/auth_service.dart';
import 'package:xshop/domain/models/product_model.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';
import 'package:xshop/domain/usecase/cart_usecase.dart';
import 'package:xshop/domain/usecase/product_usecases.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc({
    required this.productsRepository,
    required this.cartRepository,
  }) : super(const ProductCardInitial()) {
    on<LoadProductCard>(_load);
    on<AddProduct>(_addProduct);
  }

  Future<void> _addProduct(
    AddProduct event,
    Emitter<ProductCardState> state,
  ) async {
    try {
      final String? userId = AuthService().userId;
      CartUseCase(
        cartRepository,
      ).addToCart(productId: event.productId, userId: userId!);
    } catch (e, st) {
      emit(ProductCardLoadingFailure(e: e, st: st));
    }
  }

  Future<void> _load(
    LoadProductCard event,
    Emitter<ProductCardState> state,
  ) async {
    debugPrint("LOADPRODUCT_BLOC");
    try {
      if (state is! ProductCardLoaded) emit(ProductCardLoading());
      final product = await FetchOneProductUseCase(
        productRepository: productsRepository,
      ).call(productId: event.id);
      debugPrint("LOADEDPRODUCT_BLOC $product");

      emit(ProductCardLoaded(product));
    } catch (e, st) {
      emit(ProductCardLoadingFailure(e: e, st: st));
    }
  }

  ProductAbstractRepository productsRepository;
  CartAbstractRepository cartRepository;
}
