part of 'product_category_bloc.dart';

class ProducstWithCategoryState {
  const ProducstWithCategoryState();

  List<Object> get props => [];
}

class ProductLoading extends ProducstWithCategoryState {
  const ProductLoading();

  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProducstWithCategoryState {
  const ProductLoaded({required this.productList});
  final List<ProductModel?> productList;

  @override
  List<Object> get props => [productList];
}

class ProductLoadingFailure extends ProducstWithCategoryState {
  const ProductLoadingFailure({this.st, this.exception});
  final Object? exception;
  final Object? st;
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProducstWithCategoryState {}
