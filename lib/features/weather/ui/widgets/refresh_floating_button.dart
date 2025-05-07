import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';

class RefreshFloatingActionButton extends StatelessWidget {
  const RefreshFloatingActionButton({super.key, required this.viewModel});

  final WeatherViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Refresh',
      onPressed: () async {
        viewModel.isRefreshing = true;
        await viewModel.getWeatherCommand.execute();
        viewModel.isRefreshing = false;
      },
      child: AnimatedRotation(
        turns: viewModel.isRefreshing ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
