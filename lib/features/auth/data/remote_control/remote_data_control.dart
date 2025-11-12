import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xshop/features/auth/domain/models/user_model.dart';

class RemoteDataControl {
  final Dio dio;
  RemoteDataControl({required this.dio});
  final String _path = "http://localhost:5000/api";

  Future<UserModel?> login({email, phone, username, password}) async {
    try {
      Map<String, dynamic> params = {"email": email, "phone": phone,"":,"":,};
      dio.post("$_path/auth/login");
    } catch (e, st) {
      debugPrint("Error or Exception is $e\nStacktrace:\n$st");
    }
  }
}
