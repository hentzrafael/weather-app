import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/auth/ui/login_screen.dart';
import 'package:weather_app/features/auth/ui/viewmodels/login_viewmodel.dart';
import 'package:weather_app/features/weather/ui/weather_screen.dart';
import 'package:weather_app/app/router/routes.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.home,
  redirect: _redirect,
  routes: [
    GoRoute(
      path: '/login',
      builder:
          (context, state) =>
              LoginScreen(viewModel: context.read<LoginViewModel>()),
    ),
    GoRoute(path: '/', builder: (context, state) => WeatherScreen()),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final bool loggedIn = await context.read<AuthRepository>().isSignedIn();
  final bool loggingIn = state.matchedLocation == Routes.login;

  if (!loggedIn && !state.matchedLocation.startsWith("/auth")) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}
