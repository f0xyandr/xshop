import 'package:flutter/foundation.dart';
import 'package:xshop/data/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.username});

  factory UserModel.fromEntity({required UserEntity userEntity}) =>
      UserModel(
          id: userEntity.id,
          email: userEntity.email,
          username: userEntity.username,
        )
        ..phone = userEntity.phone
        ..avatarUrl = userEntity.avatarUrl
        ..bio = userEntity.bio
        ..createdAt = userEntity.createdAt
        ..settings = userEntity.settings
        ..lastLogin = userEntity.lastLogin
        ..emailConfirmed = false;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          username == other.username &&
          phone == other.phone &&
          avatarUrl == other.avatarUrl &&
          bio == other.bio &&
          createdAt == other.createdAt &&
          lastLogin == other.lastLogin &&
          mapEquals(settings, other.settings) &&
          emailConfirmed == other.emailConfirmed;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      username.hashCode ^
      phone.hashCode ^
      avatarUrl.hashCode ^
      bio.hashCode ^
      createdAt.hashCode ^
      lastLogin.hashCode ^
      settings.hashCode ^
      emailConfirmed.hashCode;

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
