// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiWeather _$ApiWeatherFromJson(Map<String, dynamic> json) => _ApiWeather(
  weather:
      (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
  base: json['base'] as String?,
  main:
      json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num?)?.toInt(),
  dt: (json['dt'] as num?)?.toInt(),
  sys:
      json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
  timezone: (json['timezone'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  cod: (json['cod'] as num?)?.toInt(),
);

Map<String, dynamic> _$ApiWeatherToJson(_ApiWeather instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  id: (json['id'] as num?)?.toInt(),
  main: json['main'] as String?,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

_Main _$MainFromJson(Map<String, dynamic> json) => _Main(
  temp: (json['temp'] as num?)?.toDouble(),
  feelsLike: (json['feelsLike'] as num?)?.toDouble(),
  tempMin: (json['tempMin'] as num?)?.toDouble(),
  tempMax: (json['tempMax'] as num?)?.toDouble(),
  pressure: (json['pressure'] as num?)?.toInt(),
  humidity: (json['humidity'] as num?)?.toInt(),
  seaLevel: (json['seaLevel'] as num?)?.toInt(),
  grndLevel: (json['grndLevel'] as num?)?.toInt(),
);

Map<String, dynamic> _$MainToJson(_Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'feelsLike': instance.feelsLike,
  'tempMin': instance.tempMin,
  'tempMax': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
  'seaLevel': instance.seaLevel,
  'grndLevel': instance.grndLevel,
};

_Sys _$SysFromJson(Map<String, dynamic> json) => _Sys(
  country: json['country'] as String?,
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$SysToJson(_Sys instance) => <String, dynamic>{
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};
