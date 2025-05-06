import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:weather_app/features/auth/ui/viewmodels/login_viewmodel.dart';

List<SingleChildWidget> providers = [
  Provider<FlutterSecureStorage>(create: (context) => FlutterSecureStorage()),
  Provider<AuthRepository>(
    create:
        (context) => AuthRepositoryImpl(context.read<FlutterSecureStorage>()),
  ),
  ChangeNotifierProvider<LoginViewModel>(
    create:
        (context) =>
            LoginViewModel(authRepository: context.read<AuthRepository>()),
  ),
];
