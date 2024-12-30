part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  const LoadProduct({required this.category});
  final ProductCategory category;

  @override
  List<Object> get props => super.props..add(category);
}
