import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xshop/features/auth/domain/models/user_model.dart';

class AuthRemoteDataControl {
  final Dio dio;
  AuthRemoteDataControl({required this.dio});
  final String _path = "http://10.182.170.238:3000/api";

  Future<void> login({email, password}) async {
    try {
      Map<String, dynamic> params = {"email": email, "password": password};
      final res = await dio.post("$_path/auth/login", data: params);
      Map<String, dynamic> resData = res.data['user'];
      debugPrint(resData.toString());
      final user = UserModel.fromJson(resData);
      debugPrint(user.toString());
    } catch (e, st) {
      debugPrint("Error or Exception is $e\nStacktrace:\n$st");
    }
  }

  Future<void> register({username, email, password}) async {
    try {
      Map<String, dynamic> params = {
        "email": email,
        "password": password,
        "username": username,
      };
      await dio.post("$_path" + "/auth/register", data: params);
    } catch (e, st) {
      debugPrint("Error or Exception is $e\nStacktrace:\n$st");
    }
  }
}
