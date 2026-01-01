part of 'product_category_bloc.dart';

abstract class ProducstWithCategoryEvent {
  const ProducstWithCategoryEvent();
}

class LoadProduct extends ProducstWithCategoryEvent {
  const LoadProduct({required this.category});
  final CategoryModel category;
}
