import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/services/location/location_service.dart';

class GeolocatorLocationService implements LocationService {
  @override
  Future<Result<Position>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Result.error(Exception('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Result.error(Exception('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Result.error(
        Exception(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
    }

    return Result.success(await Geolocator.getCurrentPosition());
  }
}
