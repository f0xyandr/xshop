part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemDisplayModel> cartItems;

  const CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;
  final Object e;
  final Object st;

  const CartError(this.message, this.e, this.st);

  @override
  List<Object> get props => [message];
}
