class AuthService {
  AuthService._();
  String? user;

  static AuthService _instance = AuthService._();

  factory AuthService() => _instance;

  void login(user) {
    this.user = user;
  }

  bool get isLoggedIn => user != null;
}
