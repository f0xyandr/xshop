import 'package:xshop/features/auth/data/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel();

  factory UserModel.fromJson(json) => UserModel()
    ..id = json["id"]
    ..email = json["email"]
    ..phone = json["phone"]
    ..avatar_url = json["avatar_url"]
    ..bio = json["bio"]
    ..created_at = json["created_at"]
    ..settings = json["settings"]
    ..last_login = json["last_login"]
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
