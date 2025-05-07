// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiWeather {

 List<Weather>? get weather; String? get base; Main? get main; int? get visibility; int? get dt; Sys? get sys; int? get timezone; int? get id; String? get name; int? get cod;
/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiWeatherCopyWith<ApiWeather> get copyWith => _$ApiWeatherCopyWithImpl<ApiWeather>(this as ApiWeather, _$identity);

  /// Serializes this ApiWeather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiWeather&&const DeepCollectionEquality().equals(other.weather, weather)&&(identical(other.base, base) || other.base == base)&&(identical(other.main, main) || other.main == main)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.sys, sys) || other.sys == sys)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cod, cod) || other.cod == cod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(weather),base,main,visibility,dt,sys,timezone,id,name,cod);

@override
String toString() {
  return 'ApiWeather(weather: $weather, base: $base, main: $main, visibility: $visibility, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
}


}

/// @nodoc
abstract mixin class $ApiWeatherCopyWith<$Res>  {
  factory $ApiWeatherCopyWith(ApiWeather value, $Res Function(ApiWeather) _then) = _$ApiWeatherCopyWithImpl;
@useResult
$Res call({
 List<Weather>? weather, String? base, Main? main, int? visibility, int? dt, Sys? sys, int? timezone, int? id, String? name, int? cod
});


$MainCopyWith<$Res>? get main;$SysCopyWith<$Res>? get sys;

}
/// @nodoc
class _$ApiWeatherCopyWithImpl<$Res>
    implements $ApiWeatherCopyWith<$Res> {
  _$ApiWeatherCopyWithImpl(this._self, this._then);

  final ApiWeather _self;
  final $Res Function(ApiWeather) _then;

/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weather = freezed,Object? base = freezed,Object? main = freezed,Object? visibility = freezed,Object? dt = freezed,Object? sys = freezed,Object? timezone = freezed,Object? id = freezed,Object? name = freezed,Object? cod = freezed,}) {
  return _then(_self.copyWith(
weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<Weather>?,base: freezed == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as Main?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,sys: freezed == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as Sys?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cod: freezed == cod ? _self.cod : cod // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainCopyWith<$Res>? get main {
    if (_self.main == null) {
    return null;
  }

  return $MainCopyWith<$Res>(_self.main!, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SysCopyWith<$Res>? get sys {
    if (_self.sys == null) {
    return null;
  }

  return $SysCopyWith<$Res>(_self.sys!, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ApiWeather implements ApiWeather {
  const _ApiWeather({final  List<Weather>? weather, this.base, this.main, this.visibility, this.dt, this.sys, this.timezone, this.id, this.name, this.cod}): _weather = weather;
  factory _ApiWeather.fromJson(Map<String, dynamic> json) => _$ApiWeatherFromJson(json);

 final  List<Weather>? _weather;
@override List<Weather>? get weather {
  final value = _weather;
  if (value == null) return null;
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? base;
@override final  Main? main;
@override final  int? visibility;
@override final  int? dt;
@override final  Sys? sys;
@override final  int? timezone;
@override final  int? id;
@override final  String? name;
@override final  int? cod;

/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiWeatherCopyWith<_ApiWeather> get copyWith => __$ApiWeatherCopyWithImpl<_ApiWeather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiWeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiWeather&&const DeepCollectionEquality().equals(other._weather, _weather)&&(identical(other.base, base) || other.base == base)&&(identical(other.main, main) || other.main == main)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.sys, sys) || other.sys == sys)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cod, cod) || other.cod == cod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_weather),base,main,visibility,dt,sys,timezone,id,name,cod);

@override
String toString() {
  return 'ApiWeather(weather: $weather, base: $base, main: $main, visibility: $visibility, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
}


}

/// @nodoc
abstract mixin class _$ApiWeatherCopyWith<$Res> implements $ApiWeatherCopyWith<$Res> {
  factory _$ApiWeatherCopyWith(_ApiWeather value, $Res Function(_ApiWeather) _then) = __$ApiWeatherCopyWithImpl;
@override @useResult
$Res call({
 List<Weather>? weather, String? base, Main? main, int? visibility, int? dt, Sys? sys, int? timezone, int? id, String? name, int? cod
});


@override $MainCopyWith<$Res>? get main;@override $SysCopyWith<$Res>? get sys;

}
/// @nodoc
class __$ApiWeatherCopyWithImpl<$Res>
    implements _$ApiWeatherCopyWith<$Res> {
  __$ApiWeatherCopyWithImpl(this._self, this._then);

  final _ApiWeather _self;
  final $Res Function(_ApiWeather) _then;

/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weather = freezed,Object? base = freezed,Object? main = freezed,Object? visibility = freezed,Object? dt = freezed,Object? sys = freezed,Object? timezone = freezed,Object? id = freezed,Object? name = freezed,Object? cod = freezed,}) {
  return _then(_ApiWeather(
weather: freezed == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<Weather>?,base: freezed == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as Main?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,sys: freezed == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as Sys?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,cod: freezed == cod ? _self.cod : cod // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainCopyWith<$Res>? get main {
    if (_self.main == null) {
    return null;
  }

  return $MainCopyWith<$Res>(_self.main!, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of ApiWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SysCopyWith<$Res>? get sys {
    if (_self.sys == null) {
    return null;
  }

  return $SysCopyWith<$Res>(_self.sys!, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// @nodoc
mixin _$Weather {

 int? get id; String? get main; String? get description; String? get icon;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.id, id) || other.id == id)&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,main,description,icon);

@override
String toString() {
  return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
 int? id, String? main, String? description, String? icon
});




}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? main = freezed,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Weather implements Weather {
  const _Weather({this.id, this.main, this.description, this.icon});
  factory _Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

@override final  int? id;
@override final  String? main;
@override final  String? description;
@override final  String? icon;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.id, id) || other.id == id)&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,main,description,icon);

@override
String toString() {
  return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? main, String? description, String? icon
});




}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? main = freezed,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_Weather(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Main {

 double? get temp; double? get feelsLike; double? get tempMin; double? get tempMax; int? get pressure; int? get humidity; int? get seaLevel; int? get grndLevel;
/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainCopyWith<Main> get copyWith => _$MainCopyWithImpl<Main>(this as Main, _$identity);

  /// Serializes this Main to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Main&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.seaLevel, seaLevel) || other.seaLevel == seaLevel)&&(identical(other.grndLevel, grndLevel) || other.grndLevel == grndLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,feelsLike,tempMin,tempMax,pressure,humidity,seaLevel,grndLevel);

@override
String toString() {
  return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity, seaLevel: $seaLevel, grndLevel: $grndLevel)';
}


}

/// @nodoc
abstract mixin class $MainCopyWith<$Res>  {
  factory $MainCopyWith(Main value, $Res Function(Main) _then) = _$MainCopyWithImpl;
@useResult
$Res call({
 double? temp, double? feelsLike, double? tempMin, double? tempMax, int? pressure, int? humidity, int? seaLevel, int? grndLevel
});




}
/// @nodoc
class _$MainCopyWithImpl<$Res>
    implements $MainCopyWith<$Res> {
  _$MainCopyWithImpl(this._self, this._then);

  final Main _self;
  final $Res Function(Main) _then;

/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = freezed,Object? feelsLike = freezed,Object? tempMin = freezed,Object? tempMax = freezed,Object? pressure = freezed,Object? humidity = freezed,Object? seaLevel = freezed,Object? grndLevel = freezed,}) {
  return _then(_self.copyWith(
temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double?,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,tempMin: freezed == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double?,tempMax: freezed == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int?,seaLevel: freezed == seaLevel ? _self.seaLevel : seaLevel // ignore: cast_nullable_to_non_nullable
as int?,grndLevel: freezed == grndLevel ? _self.grndLevel : grndLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Main implements Main {
  const _Main({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity, this.seaLevel, this.grndLevel});
  factory _Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

@override final  double? temp;
@override final  double? feelsLike;
@override final  double? tempMin;
@override final  double? tempMax;
@override final  int? pressure;
@override final  int? humidity;
@override final  int? seaLevel;
@override final  int? grndLevel;

/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainCopyWith<_Main> get copyWith => __$MainCopyWithImpl<_Main>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Main&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.seaLevel, seaLevel) || other.seaLevel == seaLevel)&&(identical(other.grndLevel, grndLevel) || other.grndLevel == grndLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,feelsLike,tempMin,tempMax,pressure,humidity,seaLevel,grndLevel);

@override
String toString() {
  return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity, seaLevel: $seaLevel, grndLevel: $grndLevel)';
}


}

/// @nodoc
abstract mixin class _$MainCopyWith<$Res> implements $MainCopyWith<$Res> {
  factory _$MainCopyWith(_Main value, $Res Function(_Main) _then) = __$MainCopyWithImpl;
@override @useResult
$Res call({
 double? temp, double? feelsLike, double? tempMin, double? tempMax, int? pressure, int? humidity, int? seaLevel, int? grndLevel
});




}
/// @nodoc
class __$MainCopyWithImpl<$Res>
    implements _$MainCopyWith<$Res> {
  __$MainCopyWithImpl(this._self, this._then);

  final _Main _self;
  final $Res Function(_Main) _then;

/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = freezed,Object? feelsLike = freezed,Object? tempMin = freezed,Object? tempMax = freezed,Object? pressure = freezed,Object? humidity = freezed,Object? seaLevel = freezed,Object? grndLevel = freezed,}) {
  return _then(_Main(
temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double?,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,tempMin: freezed == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double?,tempMax: freezed == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int?,seaLevel: freezed == seaLevel ? _self.seaLevel : seaLevel // ignore: cast_nullable_to_non_nullable
as int?,grndLevel: freezed == grndLevel ? _self.grndLevel : grndLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Sys {

 String? get country; int? get sunrise; int? get sunset;
/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SysCopyWith<Sys> get copyWith => _$SysCopyWithImpl<Sys>(this as Sys, _$identity);

  /// Serializes this Sys to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sys&&(identical(other.country, country) || other.country == country)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,sunrise,sunset);

@override
String toString() {
  return 'Sys(country: $country, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class $SysCopyWith<$Res>  {
  factory $SysCopyWith(Sys value, $Res Function(Sys) _then) = _$SysCopyWithImpl;
@useResult
$Res call({
 String? country, int? sunrise, int? sunset
});




}
/// @nodoc
class _$SysCopyWithImpl<$Res>
    implements $SysCopyWith<$Res> {
  _$SysCopyWithImpl(this._self, this._then);

  final Sys _self;
  final $Res Function(Sys) _then;

/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = freezed,Object? sunrise = freezed,Object? sunset = freezed,}) {
  return _then(_self.copyWith(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Sys implements Sys {
  const _Sys({this.country, this.sunrise, this.sunset});
  factory _Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

@override final  String? country;
@override final  int? sunrise;
@override final  int? sunset;

/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SysCopyWith<_Sys> get copyWith => __$SysCopyWithImpl<_Sys>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SysToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sys&&(identical(other.country, country) || other.country == country)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,sunrise,sunset);

@override
String toString() {
  return 'Sys(country: $country, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class _$SysCopyWith<$Res> implements $SysCopyWith<$Res> {
  factory _$SysCopyWith(_Sys value, $Res Function(_Sys) _then) = __$SysCopyWithImpl;
@override @useResult
$Res call({
 String? country, int? sunrise, int? sunset
});




}
/// @nodoc
class __$SysCopyWithImpl<$Res>
    implements _$SysCopyWith<$Res> {
  __$SysCopyWithImpl(this._self, this._then);

  final _Sys _self;
  final $Res Function(_Sys) _then;

/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = freezed,Object? sunrise = freezed,Object? sunset = freezed,}) {
  return _then(_Sys(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
