import 'package:flutter/material.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';

class FetchRandomProductsUseCase {
  final ProductAbstractRepository productRepository;

  FetchRandomProductsUseCase({required this.productRepository});

  call() => productRepository.fetchRandomProducts();
}

class FetchOneProductUseCase {
  final ProductAbstractRepository productRepository;

  FetchOneProductUseCase({required this.productRepository});

  call({required int productId}) async {
    debugPrint("CALLLOADPRODUCT");
    return await productRepository.getProduct(productId: productId);
  }
}

class FecthProductsWithCategory {
  final ProductAbstractRepository productRepository;

  FecthProductsWithCategory({required this.productRepository});

  call({required String categoryId}) async {
    debugPrint("CALLLOADPRODUCT");
    return await productRepository.getProductsWithCategory(
      categoryId: categoryId,
    );
  }
}
