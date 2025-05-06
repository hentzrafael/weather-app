import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/injection/providers.dart';
import 'package:weather_app/app/router/router.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xF25B58)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
