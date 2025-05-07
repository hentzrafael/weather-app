import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/core/storage_keys.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/repositories/location/location_repository.dart';
import 'package:weather_app/features/weather/data/services/location/location_service.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationService locationService;
  final FlutterSecureStorage secureStorage;

  LocationRepositoryImpl({
    required this.locationService,
    required this.secureStorage,
  });

  @override
  Future<Result<Position>> getCurrentPosition({
    bool forceUpdate = false,
  }) async {
    final location = await getLocation();
    if (location != null && !forceUpdate) {
      return Result.success(location);
    }
    final result = await locationService.determinePosition();
    switch (result) {
      case Success():
        await saveLocation(result.value);
        return Result.success(result.value);
      case Error():
        return Result.error(result.error);
    }
  }

  Future<void> saveLocation(Position position) async {
    await secureStorage.write(
      key: StorageKeys.location,
      value: jsonEncode(position.toJson()),
    );
  }

  Future<Position?> getLocation() async {
    final location = await secureStorage.read(key: StorageKeys.location);
    if (location == null) {
      return null;
    }
    return Position.fromMap(jsonDecode(location));
  }
}
