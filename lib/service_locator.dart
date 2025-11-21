import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/features/auth/data/remote_control/remote_data_control.dart';
import 'package:xshop/features/auth/data/repository/repo_implementation.dart';
import 'package:xshop/features/auth/domain/repository/repo_interface.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  Dio dio = Dio();

  final AuthAbstractRepository authRepository = AuthRepoImplementation(
    dataController: AuthRemoteDataControl(dio: dio),
  );

  sl.registerSingleton<AuthAbstractRepository>(authRepository);
  sl.registerSingleton<Dio>(dio);
}
