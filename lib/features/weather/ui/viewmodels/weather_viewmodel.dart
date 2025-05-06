import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/command.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final LocationRepository locationRepository;

  WeatherViewModel({required this.locationRepository}) {
    getPositionCommand = Command0(_getCurrentPosition);
  }

  late Command0 getPositionCommand;

  Position? _position;

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
    return Result.success(null);
  }
}
