import 'package:flutter/material.dart';
import 'package:xshop/data/entity/category_entity.dart';
import 'package:xshop/domain/models/category_model.dart';
import 'package:xshop/interfaces/remote_data_control_base.dart';

class CategoryRemoteDataControl extends RemoteDataControlBase {
  CategoryRemoteDataControl({required super.dio});

  Future<List<CategoryModel?>?> getCategories() async {
    try {
      final res = await dio.get("$path/category/get_categories");

      final data = res.data;

      final List entities = data
          .map((e) => CategoryEntity.fromJson(e))
          .toList();

      final List<CategoryModel?> models = entities
          .map((e) => CategoryModel.fromEntity(e))
          .toList();
      return models;
    } catch (e, st) {
      debugPrint("$e\n$st");
    }
    return null;
  }
}
