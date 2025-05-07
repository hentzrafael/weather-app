import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/storage_keys.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository_impl.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late AuthRepository authRepository;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    authRepository = AuthRepositoryImpl(mockFlutterSecureStorage);
  });

  group('AuthRepository', () {
    test(
      'login throws ArgumentError when username and password are empty',
      () async {
        // Arrange
        final username = '';
        final password = '';

        // Assert
        expect(
          () async => await authRepository.login(username, password),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test(
      'login returns void when username and password are not empty',
      () async {
        // Arrange
        final username = 'username';
        final password = 'password';

        // Act

        // Assert
        expect(
          () async => await authRepository.login(username, password),
          isA<void>(),
        );
      },
    );
    test('login saves token to secure storage', () async {
      // Arrange
      final username = 'username';
      final password = 'password';

      // Act
      await authRepository.login(username, password);

      // Assert
      verify(
        mockFlutterSecureStorage.write(
          key: StorageKeys.authToken,
          value: anyNamed('value'),
        ),
      );
    });

    test('isSignedIn returns true when token is saved and not empty', () async {
      // Arrange
      final token = 'token';
      when(
        mockFlutterSecureStorage.read(key: StorageKeys.authToken),
      ).thenAnswer((_) async => token);

      // Act
      final result = await authRepository.isSignedIn();

      // Assert
      expect(result, isTrue);
    });

    test('isSignedIn returns false when token is not saved', () async {
      // Arrange
      when(
        mockFlutterSecureStorage.read(key: StorageKeys.authToken),
      ).thenAnswer((_) async => null);

      // Act
      final result = await authRepository.isSignedIn();

      // Assert
      expect(result, isFalse);
    });

    test('isSignedIn returns false when token is empty', () async {
      // Arrange
      when(
        mockFlutterSecureStorage.read(key: StorageKeys.authToken),
      ).thenAnswer((_) async => '');

      // Act
      final result = await authRepository.isSignedIn();

      // Assert
      expect(result, isFalse);
    });

    test('logout deletes token from secure storage', () async {
      // Arrange
      final token = 'token';
      when(
        mockFlutterSecureStorage.read(key: StorageKeys.authToken),
      ).thenAnswer((_) async => token);

      // Act
      await authRepository.logout();

      // Assert
      verify(mockFlutterSecureStorage.delete(key: StorageKeys.authToken));
    });
  });
}
