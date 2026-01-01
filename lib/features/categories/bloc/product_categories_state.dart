part of 'product_categories_bloc.dart';

class ProductCategoriesState {
  const ProductCategoriesState();

  List<Object> get props => [];
}

class ProductCategoriesLoading extends ProductCategoriesState {
  const ProductCategoriesLoading();

  @override
  List<Object> get props => [];
}

class ProductCategoriesLoaded extends ProductCategoriesState {
  const ProductCategoriesLoaded({required this.productCategoriesList});
  final List<CategoryModel?> productCategoriesList;
  @override
  List<Object> get props => [productCategoriesList];
}

class ProductCategoriesLoadingFailure extends ProductCategoriesState {
  const ProductCategoriesLoadingFailure({this.st, this.exception});
  final Object? exception;
  final Object? st;
  @override
  List<Object> get props => [];
}

class ProductCategoriesInitial extends ProductCategoriesState {}
