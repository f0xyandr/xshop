// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_card_bloc.dart';

class ProductCardState {
  const ProductCardState();

  List<Object> get props => [];
}

class ProductCardInitial extends ProductCardState {
  const ProductCardInitial();

  @override
  List<Object> get props => [];
}

class ProductCardLoaded extends ProductCardState {
  const ProductCardLoaded(this.product);

  final ProductModel product;
  @override
  List<Object> get props => [];
}

class ProductCardLoading extends ProductCardState {}

class ProductCardLoadingFailure extends ProductCardState {
  Object? e;
  Object? st;
  ProductCardLoadingFailure({this.e, this.st});
}
