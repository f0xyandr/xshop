import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xshop/core/utils/auth_service.dart';
import 'package:xshop/data/datasource/remote/auth_remote_data_control.dart';
import 'package:xshop/data/datasource/remote/cart_remote_control.dart';
import 'package:xshop/data/datasource/remote/category_remote_data_control.dart';
import 'package:xshop/data/datasource/remote/product_remote_control.dart';
import 'package:xshop/data/repository/auth_repo_implementation.dart';
import 'package:xshop/data/repository/cart_repo_impl.dart';
import 'package:xshop/data/repository/category_repo_impl.dart';
import 'package:xshop/data/repository/product_repo_impl.dart';
import 'package:xshop/domain/repository/auth_repo_interface.dart';
import 'package:xshop/domain/repository/cart_repo_interface.dart';
import 'package:xshop/domain/repository/category_repo_interface.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  Dio dio = Dio();

  final AuthAbstractRepository authRepository = AuthRepoImplementation(
    dataController: AuthRemoteDataControl(dio: dio),
  );

  final CartAbstractRepository cartRepository = CartRepositoryImplementation(
    CartRemoteControl(dio: dio),
  );

  final ProductAbstractRepository productListRepo =
      ProductAbstractRepositoryImpl(
        dataController: ProductRemoteControl(dio: dio),
      );

  final CategoryAbstractRepository categoryRepo =
      CategoryAbstractRepositoryImpl(
        dataControl: CategoryRemoteDataControl(dio: dio),
      );

  final AuthService service = AuthService();

  sl.registerSingleton<AuthService>(service);
  sl.registerSingleton<AuthAbstractRepository>(authRepository);
  sl.registerSingleton<ProductAbstractRepository>(productListRepo);
  sl.registerSingleton<CategoryAbstractRepository>(categoryRepo);
  sl.registerSingleton<CartAbstractRepository>(cartRepository);
  sl.registerSingleton<Dio>(dio);
}
