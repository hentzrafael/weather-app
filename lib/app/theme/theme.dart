import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/core/storage_keys.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider({required this.secureStorage}) {
    _initTheme();
  }

  final FlutterSecureStorage secureStorage;

  void _initTheme() async {
    final savedTheme = await secureStorage.read(key: StorageKeys.themeMode);
    _themeMode =
        savedTheme == null
            ? ThemeMode.light
            : ThemeMode.values.byName(savedTheme);
    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    secureStorage.write(key: StorageKeys.themeMode, value: _themeMode.name);
    notifyListeners();
  }
}
