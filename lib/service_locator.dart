import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/features/auth/data/remote_control/remote_data_control.dart';
import 'package:xshop/features/auth/data/repository/repo_implementation.dart';
import 'package:xshop/features/auth/domain/repository/repo_interface.dart';
import 'package:xshop/features/auth/infrastructure/service/service.dart';
import 'package:xshop/features/product_list/data/remote_control/product_list_remote_control.dart';
import 'package:xshop/features/product_list/data/repository/product_list_repo_impl.dart';
import 'package:xshop/features/product_list/domain/repository/product_list_abstract_repo.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  Dio dio = Dio();

  final AuthAbstractRepository authRepository = AuthRepoImplementation(
    dataController: AuthRemoteDataControl(dio: dio),
  );

  final ProductListAbstractRepository productListRepo =
      ProductListAbstractRepositoryImpl(
        dataController: ProductListRemoteControl(dio: dio),
      );

  final AuthService service = AuthService();

  sl.registerSingleton<AuthService>(service);
  sl.registerSingleton<AuthAbstractRepository>(authRepository);
  sl.registerSingleton<ProductListAbstractRepository>(productListRepo);
  sl.registerSingleton<Dio>(dio);
}
