import 'package:dio/dio.dart';

class RemoteDataControlBase {
  final Dio dio;
  final String path = "http://10.101.134.41:3000/api";
  RemoteDataControlBase({required this.dio});
}
