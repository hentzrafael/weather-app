import 'package:dio/dio.dart';
import 'package:weather_app/app/environment/environment.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/services/weather/weather_service.dart';

class OpenWeatherService implements WeatherService {
  final Dio dio;
  final Environment environment;

  OpenWeatherService({required this.dio, required this.environment});

  @override
  Future<Result<Map<String, dynamic>>> getWeather(
    double lat,
    double lon,
  ) async {
    final response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${environment.apiKey}&units=metric',
    );
    if (response.statusCode == 200) {
      return Result.success(response.data);
    }
    return Result.error(response.data);
  }
}
