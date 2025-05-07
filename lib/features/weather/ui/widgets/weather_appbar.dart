import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/router/routes.dart';
import 'package:weather_app/app/theme/theme.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        spacing: 12,
        children: [
          Image.asset('assets/img/icon.png', width: 32, height: 32),
          const Text('Nimbus'),
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                  ? Icons.sunny
                  : Icons.nightlight,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Logout',
          onPressed: () {
            context.read<AuthRepository>().logout();
            context.go(Routes.login);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
