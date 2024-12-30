import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_shop/repositories/products/models/product_category.dart';

import '../../../repositories/products/products_repository.dart';
import '../bloc/product_bloc.dart';
import '../widgets/product_tile.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.category});

  final ProductCategory category;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _productBloc = ProductBloc(GetIt.I<ProductsRepository>());

  final _minValue = TextEditingController();
  final _maxValue = TextEditingController();

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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              AutoRouter.of(context).maybePop();
            },
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
            bloc: _productBloc,
            builder: (context, state) {
              if (state is ProductLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30),
                  itemCount: state.productList.length,
                  itemBuilder: ((context, index) {
                    final productItem = state.productList[index];
                    return ProductTile(product: productItem);
                  }),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}
