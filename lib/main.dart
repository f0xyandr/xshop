import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:online_shop/online_shop_app.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'repositories/products/products_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InByZ2JnYmhnd3B6bHZ0ZnZnZ3NqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1MjEyMzcsImV4cCI6MjA0ODA5NzIzN30.PAd4rAFyEGeSLpuRTcMOyTnYZqtmLA4SHoIi2uvOBns';
  await Supabase.initialize(
    url: 'https://prgbgbhgwpzlvtfvggsj.supabase.co',
    anonKey: anonKey,
  );
  final supabase = Supabase.instance.client;

  GetIt.I.registerSingleton(supabase);
  GetIt.I.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(dio: Dio()),
  );

  final dio = Dio();

  runApp(const OnlineShopApp());
}
