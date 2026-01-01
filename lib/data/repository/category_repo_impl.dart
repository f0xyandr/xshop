import 'package:flutter/rendering.dart';
import 'package:xshop/data/datasource/remote/category_remote_data_control.dart';
import 'package:xshop/domain/models/category_model.dart';
import 'package:xshop/domain/repository/category_repo_interface.dart';

class CategoryAbstractRepositoryImpl implements CategoryAbstractRepository {
  final CategoryRemoteDataControl dataControl;

  CategoryAbstractRepositoryImpl({required this.dataControl});

  @override
  Future<List<CategoryModel?>?> getCategories() async {
    debugPrint("CategoryAbstractRepositoryImpl");
    return await dataControl.getCategories();
  }
}
