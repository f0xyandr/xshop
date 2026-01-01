import 'package:xshop/domain/models/cart_item_model.dart';

abstract class CartAbstractRepository {
  Future<List<CartItemModel>?> getCartItems({required String userId});
  Future<void> addToCart({required int productId, required String userId});
  Future<void> removeFromCart(String productId);
  Future<void> clearCart();
}
