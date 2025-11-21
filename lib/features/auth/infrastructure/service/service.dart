class AuthService {
  AuthService._();
  String? userId;

  static AuthService _instance = AuthService._();

  factory AuthService() => _instance;

  void login(String userId) {
    this.userId = userId;
  }

  void unLogin(String userId) {
    this.userId = null;
  }

  bool get isLoggedIn => userId != null;
}
