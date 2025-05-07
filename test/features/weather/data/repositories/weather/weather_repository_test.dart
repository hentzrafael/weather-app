import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/features/weather/data/repositories/weather/weather_repository_impl.dart';
import 'package:weather_app/features/weather/data/services/weather/openweather_service.dart';
import 'package:weather_app/features/weather/domain/weather.dart';

import 'weather_repository_test.mocks.dart';

@GenerateMocks([OpenWeatherService])
void main() {
  late WeatherRepository weatherRepository;
  late MockOpenWeatherService mockWeatherService;

  setUpAll(() {
    provideDummy<Result<Map<String, dynamic>>>(Result.success({}));
  });

  setUp(() {
    mockWeatherService = MockOpenWeatherService();
    weatherRepository = WeatherRepositoryImpl(
      weatherService: mockWeatherService,
    );
  });

  group('WeatherRepository', () {
    test('getWeather returns processed weather data', () async {
      // Arrange
      final apiJson = {
        'weather': [
          {'main': 'Clear', 'description': 'clear sky'},
        ],
        'main': {'temp': 20.0},
      };

      when(
        mockWeatherService.getWeather(any, any),
      ).thenAnswer((_) async => Result.success(apiJson));

      // Act
      final result = await weatherRepository.getWeather(51.5074, -0.1278);

      // Assert
      switch (result) {
        case Success():
          expect(result.value.weather?[0].main, equals('Clear'));
          expect(result.value.main?.temp, equals(20.0));
        case Error():
          fail('Expected Success but got Error');
      }
    });

    test('getWeather handles errors properly', () async {
      // Arrange
      when(
        mockWeatherService.getWeather(any, any),
      ).thenAnswer((_) async => Result.error(Exception('API Error')));

      // Act
      final result = await weatherRepository.getWeather(51.5074, -0.1278);

      // Assert
      expect(result, isA<Error<ApiWeather>>());
    });
  });
}
