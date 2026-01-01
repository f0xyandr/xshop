import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/domain/repository/category_repo_interface.dart';
import 'package:xshop/features/product_grid/view/view.dart';

import '../bloc/product_categories_bloc.dart';
import '../widgets/category_tile.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({super.key});

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  final _productCategoriesBloc = ProductCategoriesBloc(
    GetIt.I<CategoryAbstractRepository>(),
  );

  @override
  void initState() {
    _productCategoriesBloc.add(const LoadProductCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCategoriesBloc, ProductCategoriesState>(
        bloc: _productCategoriesBloc,
        builder: (context, state) {
          if (state is ProductCategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductCategoriesLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent,
                thickness: 0.1,
                indent: 4,
                endIndent: 4,
              ),
              itemCount: state.productCategoriesList.length,
              itemBuilder: (context, index) {
                final categoryItem = state.productCategoriesList[index];
                return ProductCategoryTile(
                  category: categoryItem!,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductWithCategoryScreen(category: categoryItem),
                    ),
                  ),
                );
              },
            );
          }

          if (state is ProductCategoriesLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Failed to load categories',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _productCategoriesBloc.add(const LoadProductCategories());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      );
  }
}
