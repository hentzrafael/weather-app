import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/theme/text_styles.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';
import 'package:weather_app/features/weather/ui/widgets/weather_animation.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.viewModel});

  final WeatherViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              viewModel.weather!.name!,
              style: TextStyles.headerLarge.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            WeatherAnimation(code: viewModel.weather!.weather![0].id!),
            Text(
              viewModel.weather!.weather![0].description!.toUpperCase(),
              style: TextStyles.bodyLarge.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thermostat,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Text(
                  '${viewModel.weather!.main!.temp!.toString()}°C',
                  style: TextStyles.bodyLarge.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.water_drop,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Text(
                  '${viewModel.weather!.main!.humidity!.toString()}%',
                  style: TextStyles.bodyLarge.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Last updated: ${DateFormat('HH:mm yyyy/MM/dd').format(DateTime.now().toLocal())}",
                style: TextStyles.bodyXSmall.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
