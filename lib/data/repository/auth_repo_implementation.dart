import 'package:xshop/data/datasource/remote/auth_remote_data_control.dart';
import 'package:xshop/domain/repository/auth_repo_interface.dart';

class AuthRepoImplementation implements AuthAbstractRepository {
  final AuthRemoteDataControl dataController;
  AuthRepoImplementation({required this.dataController});

  @override
  Future<void> login({email, password}) =>
      dataController.login(email: email, password: password);

  @override
  Future<void> register({username, email, password}) =>
      dataController.register(
        username: username,
        email: email,
        password: password,
      );
}
