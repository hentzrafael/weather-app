import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/core/storage_keys.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(this._secureStorage);

  @override
  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw ArgumentError('Username and password must not be empty');
    }
    final dummyToken = 'token_${DateTime.now().millisecondsSinceEpoch}';
    await _secureStorage.write(key: StorageKeys.authToken, value: dummyToken);
  }

  @override
  Future<bool> isSignedIn() async {
    final token = await _secureStorage.read(key: StorageKeys.authToken);
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> logout() async {
    await _secureStorage.delete(key: StorageKeys.authToken);
  }
}
