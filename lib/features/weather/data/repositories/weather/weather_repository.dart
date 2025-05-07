import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/domain/weather.dart';

abstract class WeatherRepository {
  Future<Result<ApiWeather>> getWeather(double lat, double lon);
}
