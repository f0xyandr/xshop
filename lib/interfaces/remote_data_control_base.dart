import 'package:dio/dio.dart';

class RemoteDataControlBase {
  final Dio dio;

  final String path = "http://10.100.210.119:3000/api";

  RemoteDataControlBase({required this.dio});
}
