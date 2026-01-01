import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xshop/data/entity/cart_item_entity.dart';
import 'package:xshop/domain/models/cart_item_model.dart';
import 'package:xshop/interfaces/remote_data_control_base.dart';

class CartRemoteControl extends RemoteDataControlBase {
  CartRemoteControl({required super.dio});

  Future<List<CartItemModel>?> getCartItems({required String userId}) async {
    try {
      final result = await dio.get("$path/cart/get_items/$userId");

      final data = result.data;

      // debugPrint("CART MAP $data");

      final List mapped = data.map((e) => CartItemEntity.fromJson(e)).toList();
      // debugPrint("MAPPED $mapped");

      final List<CartItemModel> models = mapped
          .map((e) => CartItemModel.fromEntity(e))
          .toList();
      debugPrint("MODELS $models");

      return models;
    } catch (e, st) {
      debugPrint("$e\n$st");
    }
  }

  Future<void> addProductToCart({
    required int productId,
    required String userId,
  }) async {
    try {
      final Map<String, dynamic> params = {
        "product_id": productId,
        "user_id": userId,
      };

      await dio.post("$path/cart/add_cart_item", data: params);
    } catch (e, st) {
      debugPrint("$e\n$st");
    }
  }

  Future<void> updateCartItem({
    required int productId,
    required String userId,
    required int quantity,
  }) async {
    try {
      Map<String, dynamic> params = {"userId": userId, "quantity": quantity};

      final result = await dio.patch("$path/cart/$productId", data: params);
    } catch (e, st) {
      debugPrint("$e\n$st");
    }
  }
}
