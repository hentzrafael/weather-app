import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:weather_app/features/auth/ui/viewmodels/login_viewmodel.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository.dart';
import 'package:weather_app/features/weather/data/repositories/location_repository_impl.dart';
import 'package:weather_app/features/weather/data/services/geolocator_service.dart';
import 'package:weather_app/features/weather/data/services/location_service.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';

List<SingleChildWidget> providers = [
  Provider<FlutterSecureStorage>(create: (context) => FlutterSecureStorage()),
  Provider<AuthRepository>(
    create:
        (context) => AuthRepositoryImpl(context.read<FlutterSecureStorage>()),
  ),
  Provider<LocationService>(create: (context) => GeolocatorLocationService()),
  Provider<LocationRepository>(
    create:
        (context) => LocationRepositoryImpl(
          locationService: context.read<LocationService>(),
          secureStorage: context.read<FlutterSecureStorage>(),
        ),
  ),

  ChangeNotifierProvider<LoginViewModel>(
    create:
        (context) =>
            LoginViewModel(authRepository: context.read<AuthRepository>()),
  ),
  ChangeNotifierProvider<WeatherViewModel>(
    create:
        (context) => WeatherViewModel(
          locationRepository: context.read<LocationRepository>(),
        ),
  ),
];
