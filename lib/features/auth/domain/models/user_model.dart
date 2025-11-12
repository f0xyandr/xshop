import 'package:xshop/features/auth/data/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel fromJson(json) => UserModel()
    ..uid = json["uid"]
    ..email = json["email"]
    ..phone = json["phone"]
    ..avatar_url = json["avatar_url"]
    ..bio = json["bio"]
    ..created_at = json["created_at"]
    ..settings = json["settings"]
    ..last_login = json["last_login"]
    ..emailConfirmed = false;

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      "uid": uid,
      "email": email,
      "phone": phone,
      "emailConfirmed": emailConfirmed,
    };
  }
}
