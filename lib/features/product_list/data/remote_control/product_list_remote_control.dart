import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xshop/features/product_list/data/entities/product_list_entity.dart';
import 'package:xshop/features/product_list/domain/models/product_list_model.dart';
import 'package:xshop/interfaces/remote_data_control_base.dart';

class ProductListRemoteControl extends RemoteDataControlBase {
  ProductListRemoteControl({required super.dio});
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

      return models;
    } catch (e, st) {
      debugPrint("Error $e\n\nStackTrace is:$st");
    }
  }
}
