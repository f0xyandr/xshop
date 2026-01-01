part of 'product_card_bloc.dart';

class ProductCardEvent {
  const ProductCardEvent();
}

class AddProduct extends ProductCardEvent {
  final int productId;

  const AddProduct({required this.productId});
}

class LoadProductCard extends ProductCardEvent {
  final int id;

  const LoadProductCard(this.id);
}
