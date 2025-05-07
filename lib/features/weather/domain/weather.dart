import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
abstract class ApiWeather with _$ApiWeather {
  const factory ApiWeather({
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) = _ApiWeather;

  factory ApiWeather.fromJson(Map<String, dynamic> json) =>
      _$ApiWeatherFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
abstract class Sys with _$Sys {
  const factory Sys({String? country, int? sunrise, int? sunset}) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
