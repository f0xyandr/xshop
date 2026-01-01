import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xshop/core/utils/auth_service.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';
import '../../../../domain/models/cart_item_model.dart';
import '../../../../domain/models/product_model.dart';
import 'package:xshop/domain/models/cart_item_display_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartAbstractRepository cartRepository;
  final ProductAbstractRepository productRepository;
  CartBloc({required this.cartRepository, required this.productRepository})
    : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
  }
  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final userId = AuthService().userId;
      final List<CartItemModel>? cartItems = await cartRepository.getCartItems(
        userId: userId!,
      );
      if (cartItems == null || cartItems.isEmpty) {
        emit(const CartLoaded([]));
        return;
      }
      final List<int> productIds = cartItems
          .map((item) => item.productId)
          .toList();
      final List<ProductModel>? products = await productRepository
          .getProductsByIds(ids: productIds);
      final Map<int, ProductModel> productMap = {
        for (var product in products!) product.id: product,
      };
      final List<CartItemDisplayModel> displayItems = cartItems
          .map((cartItem) {
            final product = productMap[cartItem.productId];
            // It's possible a product in the cart doesn't exist anymore.
            // We'll filter those out.
            if (product == null) {
              return null;
            }
            return CartItemDisplayModel(
              product: product,
              quantity: cartItem.quantity,
            );
          })
          .whereType<CartItemDisplayModel>() // Removes nulls
          .toList();

      emit(CartLoaded(displayItems));
    } catch (e, st) {
      emit(CartError("Failed to load cart: ${e.toString()}", e, st));
    }
  }
}
