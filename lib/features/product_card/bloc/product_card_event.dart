part of 'product_card_bloc.dart';

class ProductCardEvent extends Equatable {
  const ProductCardEvent();

  @override
  List<Object> get props => [];
}

class LoadProductCard extends ProductCardEvent {
  final Product product;

  const LoadProductCard(this.product);
}
