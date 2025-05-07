import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/router/routes.dart';
import 'package:weather_app/app/theme/text_styles.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';
import 'package:weather_app/features/weather/ui/widgets/sun_progress_indicator.dart';
import 'package:weather_app/features/weather/ui/widgets/weather_animation.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherViewModel viewModel;
  const WeatherScreen({super.key, required this.viewModel});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getWeatherCommand.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          widget.viewModel.isRefreshing = true;
          await widget.viewModel.getWeatherCommand.execute();
          widget.viewModel.isRefreshing = false;
        },
        child: AnimatedRotation(
          turns: widget.viewModel.isRefreshing ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: const Icon(Icons.refresh),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthRepository>().logout();
              context.go(Routes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                widget.viewModel.getPositionCommand.running ||
                        widget.viewModel.getWeatherCommand.running
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        Card(
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  widget.viewModel.weather!.name!,
                                  style: TextStyles.headerLarge.copyWith(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                  ),
                                ),
                                WeatherAnimation(
                                  code:
                                      widget.viewModel.weather!.weather![0].id!,
                                ),
                                Text(
                                  widget
                                      .viewModel
                                      .weather!
                                      .weather![0]
                                      .description!
                                      .toUpperCase(),
                                  style: TextStyles.bodyLarge.copyWith(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.thermostat,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onSecondary,
                                    ),
                                    Text(
                                      '${widget.viewModel.weather!.main!.temp!.toString()}°C',
                                      style: TextStyles.bodyLarge.copyWith(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      Icons.water_drop,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onSecondary,
                                    ),
                                    Text(
                                      '${widget.viewModel.weather!.main!.humidity!.toString()}%',
                                      style: TextStyles.bodyLarge.copyWith(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SunProgressIndicator(
                          sunrise: widget.viewModel.weather!.sys!.sunrise!,
                          sunset: widget.viewModel.weather!.sys!.sunset!,
                        ),
                      ],
                    ),
          );
        },
      ),
    );
  }
}
