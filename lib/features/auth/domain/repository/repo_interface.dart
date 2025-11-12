import 'package:xshop/features/auth/domain/models/user_model.dart';

abstract class AbstractRepository {
  Future<UserModel?> login({email, phone, username, password});
  Future<UserModel?> registration({email, username, password});
}
