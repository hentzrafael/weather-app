import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app/app/environment/environment.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:weather_app/features/auth/ui/viewmodels/login_viewmodel.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository_impl.dart';
import 'package:weather_app/features/weather/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/features/weather/data/repositories/weather/weather_repository_impl.dart';
import 'package:weather_app/features/weather/data/services/geolocator_service.dart';
import 'package:weather_app/features/weather/data/services/location_service.dart';
import 'package:weather_app/features/weather/data/services/weather/openweather_service.dart';
import 'package:weather_app/features/weather/data/services/weather/weather_service.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';

List<SingleChildWidget> providers = [
  //Base ones
  Provider<FlutterSecureStorage>(create: (context) => FlutterSecureStorage()),
  Provider<Environment>(create: (context) => Environment()),
  Provider<Dio>(create: (context) => Dio()),

  //Services
  Provider<LocationService>(create: (context) => GeolocatorLocationService()),

  Provider<WeatherService>(
    create:
        (context) => OpenWeatherService(
          dio: context.read<Dio>(),
          environment: context.read<Environment>(),
        ),
  ),
  //Repositories
  Provider<AuthRepository>(
    create:
        (context) => AuthRepositoryImpl(context.read<FlutterSecureStorage>()),
  ),
  Provider<LocationRepository>(
    create:
        (context) => LocationRepositoryImpl(
          locationService: context.read<LocationService>(),
          secureStorage: context.read<FlutterSecureStorage>(),
        ),
  ),
  Provider<WeatherRepository>(
    create:
        (context) => WeatherRepositoryImpl(
          weatherService: context.read<WeatherService>(),
        ),
  ),

  //ViewModels
  ChangeNotifierProvider<LoginViewModel>(
    create:
        (context) =>
            LoginViewModel(authRepository: context.read<AuthRepository>()),
  ),
  ChangeNotifierProvider<WeatherViewModel>(
    create:
        (context) => WeatherViewModel(
          locationRepository: context.read<LocationRepository>(),
          weatherRepository: context.read<WeatherRepository>(),
        ),
  ),
];
