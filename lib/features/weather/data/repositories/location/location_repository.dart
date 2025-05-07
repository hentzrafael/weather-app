import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/result.dart';

abstract class LocationRepository {
  Future<Result<Position>> getCurrentPosition({bool forceUpdate = false});
}
