import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/injection/providers.dart';
import 'package:weather_app/app/router/router.dart';
import 'package:weather_app/app/theme/theme.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');

  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: context.read<ThemeProvider>(),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Nimbus',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: context.watch<ThemeProvider>().themeMode,
          routerConfig: router,
        );
      },
    );
  }
}
