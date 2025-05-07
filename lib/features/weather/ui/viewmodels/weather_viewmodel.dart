import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/command.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository.dart';
import 'package:weather_app/features/weather/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/features/weather/domain/weather.dart';

class WeatherViewModel extends ChangeNotifier {
  final LocationRepository locationRepository;
  final WeatherRepository weatherRepository;

  WeatherViewModel({
    required this.locationRepository,
    required this.weatherRepository,
  }) {
    getPositionCommand = Command0(_getCurrentPosition);
    getWeatherCommand = Command0(_getWeather);
  }

  late Command0 getPositionCommand;
  late Command0 getWeatherCommand;

  bool isRefreshing = false;

  Position? _position;
  ApiWeather? _weather;

  ApiWeather? get weather => _weather;
  set weather(ApiWeather? value) {
    _weather = value;
    notifyListeners();
  }

  Position? get position => _position;
  set position(Position? value) {
    _position = value;
    notifyListeners();
  }

  Future<Result<Position>> _getCurrentPosition() async {
    final position = await locationRepository.getCurrentPosition();
    switch (position) {
      case Success():
        this.position = position.value;
        return Result.success(position.value);
      case Error():
        return Result.error(position.error);
    }
  }

  Future<Result<dynamic>> _getWeather() async {
    if (position == null || isRefreshing) {
      await getPositionCommand.execute();
    }

    if (position == null && getPositionCommand.error) {
      return Result.error(Exception('Position is null'));
    }

    final result = await weatherRepository.getWeather(
      position!.latitude,
      position!.longitude,
    );
    switch (result) {
      case Success():
        this.weather = result.value;
        return Result.success(result.value);
      case Error():
        return Result.error(result.error);
    }
  }
}
