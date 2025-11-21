import 'package:xshop/features/auth/data/remote_control/remote_data_control.dart';

import '../../domain/repository/repo_interface.dart';

class AuthRepoImplementation implements AuthAbstractRepository {
  final AuthRemoteDataControl dataController;
  AuthRepoImplementation({required this.dataController});

  @override
  Future<void> login({email, password}) async {
    await dataController.login(email: email, password: password);
  }

  @override
  Future<void> register({username, email, password}) async {
    await dataController.register(
      username: username,
      email: email,
      password: password,
    );
  }
}
