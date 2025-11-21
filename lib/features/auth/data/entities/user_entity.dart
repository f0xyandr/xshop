import 'package:xshop/features/auth/domain/models/user_model.dart';

class UserEntity {
  String? id;
  String? email;
  String? username;
  String? phone;
  String? avatar_url;
  String? bio;
  String? created_at;
  String? last_login;
  Map? settings;
  bool? emailConfirmed;
  UserEntity();
}

UserModel toModel(UserEntity userEntity) => UserModel()
  ..email = userEntity.email
  ..phone = userEntity.phone
  ..avatar_url = userEntity.avatar_url
  ..bio = userEntity.bio
  ..created_at = userEntity.created_at
  ..settings = userEntity.settings
  ..last_login = userEntity.last_login
  ..emailConfirmed = false;
