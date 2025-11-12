import 'package:xshop/features/auth/data/remote_control/remote_data_control.dart';
import 'package:xshop/features/auth/domain/models/user_model.dart';

import '../../domain/repository/repo_interface.dart';

class RepoImplementation implements AbstractRepository {
  final RemoteDataControl dataController;
  RepoImplementation({required this.dataController});

  @override
  Future<UserModel?> login({email, phone, username, password}) async {
    UserModel? result = await dataController.login(
      email: email,
      phone: phone,
      username: username,
      password: password,
    );
    return result;
  }

  @override
  Future<UserModel?> registration({email, username, password}) async {
    // TODO: implement registration
    throw UnimplementedError();
  }
}
