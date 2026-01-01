import 'dart:async';

import 'package:xshop/domain/models/product_list_model.dart';
import 'package:xshop/domain/models/product_model.dart';

abstract class ProductAbstractRepository {
  Future<List<ProductListModel>?> fetchRandomProducts() async {
    return null;
  }

  Future<ProductModel?> getProduct({required int productId}) async {
    return null;
  }

  Future<List<ProductModel>?> getProductsByIds({required List<int> ids}) async {
    return [];
  }

  Future<List<ProductModel?>?> getProductsWithCategory({
    required String categoryId,
  }) async {
    return null;
  }

  Future<ProductModel?> addProduct() async {
    return null;
  }

  Future<bool?> addProductToCart({required int productId}) async {
    return null;
  }
}
