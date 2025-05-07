import 'package:weather_app/core/utils/result.dart';

abstract class WeatherService {
  Future<Result<Map<String, dynamic>>> getWeather(double lat, double lon);
}
