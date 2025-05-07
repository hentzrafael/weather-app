import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/features/weather/data/services/weather/weather_service.dart';
import 'package:weather_app/features/weather/domain/weather.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService weatherService;

  WeatherRepositoryImpl({required this.weatherService});

  @override
  Future<Result<ApiWeather>> getWeather(double lat, double lon) async {
    final result = await weatherService.getWeather(lat, lon);
    switch (result) {
      case Success():
        return Result.success(ApiWeather.fromJson(result.value));
      case Error():
        return Result.error(result.error);
    }
  }
}
