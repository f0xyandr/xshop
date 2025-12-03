import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:xshop/features/product_list/domain/repository/product_list_abstract_repo.dart';
import 'package:xshop/features/product_list/presentation/bloc/home_bloc.dart';
import 'package:xshop/features/product_list/presentation/widgets/product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    debugPrint("INITSTATED");
    _homeBloc = HomeBloc(GetIt.I<ProductListAbstractRepository>())
      ..add(LoadHomeProducts());
  }

  @override
  void dispose() {
    _homeBloc.close();
    debugPrint("DISPOSED");

    super.dispose();
  }

  Widget _buildHomeContent() {
    return RefreshIndicator(
      onRefresh: () {
        final completer = Completer();
        _homeBloc.add(LoadHomeProducts(completer: completer));
        return completer.future;
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (query) {
                // Handle search logic
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              bloc: _homeBloc,
              builder: (context, state) {
                if (state is HomeLoaded) {
                  debugPrint("HOMELOADED");
                  final products = state.randomProducts;
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: products?.length,
                    itemBuilder: (context, index) {
                      final product = products?[index];
                      return ProductTile(product: product!);
                    },
                  );
                }
                debugPrint("HOMELOADING...");

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: _buildHomeContent(),
    );
  }
}
