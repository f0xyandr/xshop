import 'package:xshop/domain/models/cart_item_model.dart';
import 'package:xshop/domain/models/product_model.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';

class CartUseCase {
  final CartAbstractRepository _repository;

  CartUseCase(this._repository);

  Future<void> addToCart({required int productId, required String userId}) {
    return _repository.addToCart(productId: productId, userId: userId);
  }

  Future<void> removeFromCart(String productId) {
    return _repository.removeFromCart(productId);
  }

  Future<List<CartItemModel>?> getCartItems({required userId}) async {
    return await _repository.getCartItems(userId: userId);
  }

  Future<void> clearCart() {
    return _repository.clearCart();
  }
}
