import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/storage_keys.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/repositories/location/location_repository.dart';
import 'package:weather_app/features/weather/data/repositories/location/location_repository_impl.dart';
import 'package:weather_app/features/weather/data/services/location/geolocator_service.dart';

import 'location_repository_test.mocks.dart';

@GenerateMocks([GeolocatorLocationService, FlutterSecureStorage])
void main() {
  late LocationRepository locationRepository;
  late MockGeolocatorLocationService mockGeolocatorLocationService;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUpAll(() {
    provideDummy<Result<Position>>(
      Result.success(
        Position.fromMap({"latitude": 51.5074, "longitude": -0.1278}),
      ),
    );
  });

  setUp(() {
    mockGeolocatorLocationService = MockGeolocatorLocationService();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    locationRepository = LocationRepositoryImpl(
      locationService: mockGeolocatorLocationService,
      secureStorage: mockFlutterSecureStorage,
    );
  });

  group('LocationRepository', () {
    test(
      'getCurrentPosition returns Position value when no location is saved',
      () async {
        // Arrange
        final position = Position.fromMap({
          "latitude": 51.5074,
          "longitude": -0.1278,
        });

        when(
          mockGeolocatorLocationService.determinePosition(),
        ).thenAnswer((_) async => Result.success(position));

        when(
          mockFlutterSecureStorage.read(key: StorageKeys.location),
        ).thenAnswer((_) async => null);

        // Act
        final result = await locationRepository.getCurrentPosition();

        // Assert
        switch (result) {
          case Success():
            expect(result.value, isA<Position>());
          case Error():
            fail('Expected Success but got Error');
        }
      },
    );

    test(
      'getCurrentPosition handles errors properly when geolocator returns error',
      () async {
        // Arrange
        when(
          mockGeolocatorLocationService.determinePosition(),
        ).thenAnswer((_) async => Result.error(Exception('API Error')));

        when(
          mockFlutterSecureStorage.read(key: StorageKeys.location),
        ).thenAnswer((_) async => null);

        // Act
        final result = await locationRepository.getCurrentPosition();

        // Assert
        expect(result, isA<Error>());
      },
    );
    test('getCurrentPosition returns saved location when it exists', () async {
      // Arrange
      final position = Position.fromMap({
        "latitude": 51.5074,
        "longitude": -0.1278,
      });

      when(
        mockFlutterSecureStorage.read(key: StorageKeys.location),
      ).thenAnswer((_) async => jsonEncode(position.toJson()));

      // Act
      final result = await locationRepository.getCurrentPosition();

      // Assert
      expect(result, isA<Success>());
    });
  });
}
