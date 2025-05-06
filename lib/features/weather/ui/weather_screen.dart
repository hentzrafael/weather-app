import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/auth/data/repositories/auth_repository.dart';
import 'package:weather_app/features/weather/ui/viewmodels/weather_viewmodel.dart';

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
    //TODO: Get weather data
    widget.viewModel.getPositionCommand.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthRepository>().logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return Center(
            child:
                widget.viewModel.getPositionCommand.completed
                    ? Text(widget.viewModel.position!.toString())
                    : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
