import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/core/utils/auth_service.dart';
import 'package:xshop/data/entity/product_entity.dart';
import 'package:xshop/data/entity/product_list_entity.dart';
import 'package:xshop/domain/models/product_list_model.dart';
import 'package:xshop/domain/models/product_model.dart';
import 'package:xshop/interfaces/remote_data_control_base.dart';

class ProductRemoteControl extends RemoteDataControlBase {
  ProductRemoteControl({required super.dio});
  Future<List<ProductListModel>?> fetchRandomProducts() async {
    try {
      debugPrint("RANDOMPRODUCT_FETCHED");
      final res = await dio.get("$path/product/fetch_random_products");
      final List products = res.data;

      final entities = products
          .map((e) => ProductListEntity.fromJson(e))
          .toList();

      final models = entities
          .map((e) => ProductListModel.fromEntity(e))
          .toList();

      debugPrint(models.toString());

      return models;
    } catch (e, st) {
      debugPrint("Error $e\n\nStackTrace is:$st");
      return null;
    }
  }

  Future<ProductModel?> getProduct({required int productId}) async {
    try {
      final res = await dio.get("$path/product/get_one_product/$productId");
      final product = res.data;

      final entity = ProductEntity.fromJson(product);

      final model = ProductModel.fromEntity(entity);

      return model;
    } catch (e, st) {
      debugPrint("Error $e\n\nStackTrace is:$st");
      return null;
    }
  }

  Future<bool> addProductToCart({required int productId}) async {
    try {
      Map<String, dynamic> params = {
        "user_id": GetIt.I.get<AuthService>().userId,
        "product_id": productId,
      };
      await dio.post(
        "http://localhost:3000/api/cart/add_cart_item",
        data: params,
      );

      return true;
    } catch (e, st) {
      debugPrint("$e\n$st");
      return false;
    }
  }

  Future<List<ProductModel>?> getProductsWithCategory({
    required String categoryId,
  }) async {
    try {
      Map<dynamic, String> params = {"category_id": categoryId};
      final res = await dio.get(
        "$path/product/get_products_with_category/",
        data: params,
      );
      final List products = res.data;

      final entities = products.map((e) => ProductEntity.fromJson(e)).toList();

      final models = entities.map((e) => ProductModel.fromEntity(e)).toList();
      return models;
    } catch (e, st) {
      debugPrint("Error $e\n\nStackTrace is:$st");
      return null;
    }
  }

  Future<List<ProductModel>?> getProductsByIds({required List<int> ids}) async {
    try {
      Map<String, dynamic> params = {"ids": ids};
      final res = await dio.get(
        "$path/product/get_products_by_ids/",
        data: params,
      );
      final List products = res.data;

      final entities = products.map((e) => ProductEntity.fromJson(e)).toList();

      final models = entities.map((e) => ProductModel.fromEntity(e)).toList();
      return models;
    } catch (e, st) {
      debugPrint("Error $e\n\nStackTrace is:$st");
      return null;
    }
  }
}
