import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherAnimation extends StatefulWidget {
  final int code;
  const WeatherAnimation({super.key, required this.code});

  @override
  State<WeatherAnimation> createState() => _WeatherAnimationState();
}

class _WeatherAnimationState extends State<WeatherAnimation> {
  _getAnimationPath(int code, DateTime now) {
    final isDay = now.hour > 6 && now.hour < 18;
    String path = '';
    if (code == 800) {
      path = 'clear';
    } else if (code > 800) {
      path = 'clouds';
    } else if (code > 700) {
      path = 'mist';
    } else if (code > 600) {
      path = 'snow';
    } else if (code > 300) {
      path = 'rain';
    } else if (code > 200) {
      path = 'thunderstorm';
    }

    if (!isDay) {
      path = '$path-night';
    }
    return 'assets/animations/$path.json';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(_getAnimationPath(widget.code, DateTime.now()));
  }
}
