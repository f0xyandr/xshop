import 'package:xshop/features/auth/data/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.username});

  factory UserModel.fromEntity({required UserEntity userEntity}) =>
      UserModel(
          id: userEntity.id,
          email: userEntity.email,
          username: userEntity.username,
        )
        ..phone = userEntity.phone
        ..avatar_url = userEntity.avatar_url
        ..bio = userEntity.bio
        ..created_at = userEntity.created_at
        ..settings = userEntity.settings
        ..last_login = userEntity.last_login
        ..emailConfirmed = false;

  @override
  String toString() {
    return 'UserModel of user $username:\n{uid: $id,\nemail: $email,\nphone: $phone,\nemailConfirmed: $emailConfirmed}\n';
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      "uid": id,
      "email": email,
      "phone": phone,
      "emailConfirmed": emailConfirmed,
    };
  }
}
