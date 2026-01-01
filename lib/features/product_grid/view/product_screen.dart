import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/domain/models/category_model.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';
import 'package:xshop/features/product_card/product_card.dart';
import 'package:xshop/features/product_grid/bloc/product_category_bloc.dart';

import '../widgets/product_tile.dart';

class ProductWithCategoryScreen extends StatefulWidget {
  const ProductWithCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  State<ProductWithCategoryScreen> createState() =>
      _ProductWithCategoryScreenState();
}

class _ProductWithCategoryScreenState extends State<ProductWithCategoryScreen> {
  final _productBloc = ProducstWithCategoryBloc(
    GetIt.I.get<ProductAbstractRepository>(),
  );

  @override
  void initState() {
    _productBloc.add(LoadProduct(category: widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.categoryName,
          style: const TextStyle(color: Colors.teal, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      body: BlocBuilder<ProducstWithCategoryBloc, ProducstWithCategoryState>(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is ProductLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              itemCount: state.productList.length,
              itemBuilder: ((context, index) {
                final productItem = state.productList[index];
                return ProductTile(
                  product: productItem,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductCardScreen(
                        productId: productItem!.id,
                        title: productItem.title,
                      ),
                    ),
                  ),
                );
              }),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
