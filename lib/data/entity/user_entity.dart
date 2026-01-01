class UserEntity {
  String id;
  String email;
  String username;
  String? phone;
  String? avatarUrl;
  String? bio;
  String? createdAt;
  String? lastLogin;
  Map? settings;
  bool? emailConfirmed;
  UserEntity({
    required this.id,
    required this.email,
    required this.username,
    this.phone,
    this.avatarUrl,
    this.bio,
    this.createdAt,
    this.lastLogin,
    this.emailConfirmed,
    this.settings,
  });

  @override
  String toString() {
    return 'UserModel of user $username:\n{uid: $id,\nemail: $email,\nphone: $phone,\nemailConfirmed: $emailConfirmed}\n';
  }
}
