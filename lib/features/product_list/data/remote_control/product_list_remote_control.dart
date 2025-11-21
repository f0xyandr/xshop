import 'package:dio/dio.dart';
import 'package:xshop/features/product_list/data/entities/product_list_entity.dart';
import 'package:xshop/features/product_list/domain/models/product_list_model.dart';

class ProductListRemoteControl {
  Dio dio;

  ProductListRemoteControl({required this.dio});

  Future<List<ProductListModel?>?> fetchRandomProducts() async {
    return null;
  }
}
