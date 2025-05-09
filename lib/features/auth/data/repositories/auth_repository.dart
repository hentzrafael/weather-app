abstract class AuthRepository {
  Future<void> login(String username, String password);
  Future<bool> isSignedIn();
  Future<void> logout();
}
