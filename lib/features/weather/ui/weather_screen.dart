import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';
import 'package:weather_app/features/weather/ui/widgets/refresh_floating_button.dart';
import 'package:weather_app/features/weather/ui/widgets/sun_progress_indicator.dart';
import 'package:weather_app/features/weather/ui/widgets/weather_appbar.dart';
import 'package:weather_app/features/weather/ui/widgets/weather_card.dart';

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
      floatingActionButton: RefreshFloatingActionButton(
        viewModel: widget.viewModel,
      ),
      appBar: const WeatherAppBar(),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child:
                widget.viewModel.getWeatherCommand.running
                    ? Center(
                      child: Lottie.asset('assets/animations/loading.json'),
                    )
                    : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: WeatherCard(viewModel: widget.viewModel),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: SunProgressIndicator(
                                sunrise:
                                    widget.viewModel.weather!.sys!.sunrise!,
                                sunset: widget.viewModel.weather!.sys!.sunset!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
          );
        },
      ),
    );
  }
}
