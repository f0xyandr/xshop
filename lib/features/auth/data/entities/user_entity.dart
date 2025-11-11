class UserEntity {
  String? uid;
  String? email;
  String? username;
  String? phone;
  bool? emailConfirmed;
  UserEntity();
}

UserEntity fromJson(json) => UserEntity()
  ..uid = json["uid"]
  ..email = json["email"]
  ..phone = json["phone"]
  ..emailConfirmed = false;
