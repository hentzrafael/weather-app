import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/result.dart';

abstract class LocationService {
  Future<Result<Position>> determinePosition();
}
