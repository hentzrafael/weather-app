import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/command.dart';
import 'package:weather_app/core/utils/result.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  LoginViewModel({required this.authRepository}) {
    loginCommand = Command2<dynamic, String, String>(_login);
  }

  late Command2 loginCommand;

  Future<Result<void>> _login(String email, String password) async {
    try {
      await authRepository.login(email, password);
      return const Result.success(null);
    } catch (e) {
      return Result.error(e as Exception);
    }
  }
}
