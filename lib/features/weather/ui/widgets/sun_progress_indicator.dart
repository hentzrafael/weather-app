import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class SunProgressIndicator extends StatelessWidget {
  final int sunrise;
  final int sunset;

  const SunProgressIndicator({
    super.key,
    required this.sunrise,
    required this.sunset,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
    final sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);

    // Calculate progress
    final totalDayLength = sunset - sunrise;
    final progress = (now - sunrise) / totalDayLength;
    final clampedProgress = progress.clamp(0.0, 1.0);

    // Calculate time remaining
    Duration timeUntilSunset = sunsetTime.difference(DateTime.now());
    if (timeUntilSunset.isNegative) {
      timeUntilSunset = Duration.zero;
    }
    Duration timeSinceSunrise = DateTime.now().difference(sunriseTime);
    if (timeSinceSunrise.isNegative) {
      timeSinceSunrise = Duration.zero;
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          width: 240,
          child: CustomPaint(painter: SunArcPainter(progress: clampedProgress)),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Since sunrise at ${DateFormat('HH:mm').format(sunriseTime)}',
                ),
                Text(
                  '${timeSinceSunrise.inHours}h ${timeSinceSunrise.inMinutes % 60}m',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Until sunset at ${DateFormat('HH:mm').format(sunsetTime)}',
                ),
                Text(
                  '${timeUntilSunset.inHours}h ${timeUntilSunset.inMinutes % 60}m',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SunArcPainter extends CustomPainter {
  final double progress;

  SunArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey[300]!
          ..style = PaintingStyle.stroke
          ..strokeWidth = 12;

    final progressPaint =
        Paint()
          ..color = Colors.orange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 12;

    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    // Draw background arc (upper half)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      paint,
    );

    // Draw progress arc (upper half)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * progress,
      false,
      progressPaint,
    );

    // Draw sun circle
    final sunPosition = _calculateSunPosition(center, radius, progress);
    canvas.drawCircle(sunPosition, 15, Paint()..color = Colors.orange);
  }

  Offset _calculateSunPosition(Offset center, double radius, double progress) {
    final angle = (1 - progress) * math.pi;
    final x = center.dx + radius * math.cos(angle);
    final y = center.dy - radius * math.sin(angle);
    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
