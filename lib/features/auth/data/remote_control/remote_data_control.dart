import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/features/auth/infrastructure/service/service.dart';
import 'package:xshop/interfaces/remote_data_control_base.dart';

class AuthRemoteDataControl extends RemoteDataControlBase {
  AuthRemoteDataControl({required super.dio});

  Future<void> login({email, password}) async {
    try {
      Map<String, dynamic> params = {"email": email, "password": password};

      final res = await dio.post("$path/auth/login", data: params);
      Map<String, dynamic> userJson = res.data['user'];

      debugPrint(userJson.toString());

      GetIt.I.get<AuthService>().login(userJson['id']);
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
      final res = await dio.post("$path/auth/register", data: params);
      Map<String, dynamic> userJson = res.data['user'];

      debugPrint(userJson.toString());

      GetIt.I.get<AuthService>().login(userJson['id']);
    } catch (e, st) {
      debugPrint("Error or Exception is $e\nStacktrace:\n$st");
    }
  }
}
