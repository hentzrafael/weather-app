import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/environment/environment.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/weather/data/services/weather/openweather_service.dart';

import 'weather_service_test.mocks.dart';

@GenerateMocks([Dio, Environment])
void main() {
  late OpenWeatherService weatherService;
  late MockDio mockHttpClient;
  late MockEnvironment mockEnvironment;

  setUp(() {
    mockHttpClient = MockDio();
    mockEnvironment = MockEnvironment();
    weatherService = OpenWeatherService(
      dio: mockHttpClient,
      environment: mockEnvironment,
    );
  });

  group('WeatherService', () {
    test('getWeather returns weather data when http call succeeds', () async {
      // Arrange
      final responseData = {
        'weather': [
          {'main': 'Clear', 'description': 'clear sky'},
        ],
        'main': {'temp': 20.0},
      };

      when(mockEnvironment.apiKey).thenReturn('1234567890');

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // Act
      final result = await weatherService.getWeather(51.5074, -0.1278);

      switch (result) {
        case Success():
          expect(result.value['weather'][0]['main'], equals('Clear'));
          expect(result.value['main']['temp'], equals(20.0));
        case Error():
          fail('Expected Success but got Error');
      }

      // Assert
      expect(result.value['weather'][0]['main'], equals('Clear'));
      expect(result.value['main']['temp'], equals(20.0));
    });

    test(
      'getWeather throws exception when http call returns different status code',
      () async {
        when(mockEnvironment.apiKey).thenReturn('1234567890');

        // Arrange
        when(mockHttpClient.get(any)).thenAnswer(
          (_) async => Response(
            data: {'error': 'Not Found'},
            statusCode: 404,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // Act & Assert
        final result = await weatherService.getWeather(51.5074, -0.1278);
        expect(result, isA<Error>());
      },
    );

    test('getWeather throws exception when http call fails', () async {
      when(mockEnvironment.apiKey).thenReturn('1234567890');

      when(mockHttpClient.get(any)).thenThrow(Exception('Test Exception'));

      final result = await weatherService.getWeather(51.5074, -0.1278);
      expect(result, isA<Error>());
      switch (result) {
        case Error():
          expect(result.error, isA<Exception>());
        case Success():
          fail('Expected Error but got Success');
      }
    });
  });
}
