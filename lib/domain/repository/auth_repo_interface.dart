abstract class AuthAbstractRepository {
  Future<void> login({email, password});
  Future<void> register({username, email, password});
}
