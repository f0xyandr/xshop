import 'package:xshop/features/auth/domain/models/user_model.dart';

class UserEntity {
  String id;
  String email;
  String username;
  String? phone;
  String? avatar_url;
  String? bio;
  String? created_at;
  String? last_login;
  Map? settings;
  bool? emailConfirmed;
  UserEntity({
    required this.id,
    required this.email,
    required this.username,
    this.phone,
    this.avatar_url,
    this.bio,
    this.created_at,
    this.last_login,
    this.emailConfirmed,
    this.settings,
  });

  @override
  String toString() {
    return 'UserModel of user $username:\n{uid: $id,\nemail: $email,\nphone: $phone,\nemailConfirmed: $emailConfirmed}\n';
  }
}
