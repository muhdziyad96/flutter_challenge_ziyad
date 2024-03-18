import 'dart:math';

import 'package:flutter/material.dart';

class PolkaDotBackground extends StatelessWidget {
  const PolkaDotBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size.infinite,
        painter: PolkaDotPainter(),
      ),
    );
  }
}

class PolkaDotPainter extends CustomPainter {
  final List<Offset> fixedDots = [
    const Offset(50, 50),
    const Offset(100, 200),
    const Offset(200, 100),
    const Offset(300, 150),
    const Offset(400, 300),
    const Offset(500, 200),
    const Offset(600, 100),
    const Offset(700, 250),
    const Offset(800, 150),
    const Offset(900, 100),
    const Offset(100, 400),
    const Offset(200, 500),
    const Offset(300, 600),
    const Offset(400, 700),
    const Offset(500, 800),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.red[100]!;

    const double radius = 15; // Radius of the polka dots

    for (final dot in fixedDots) {
      Offset adjustedDot = adjustDotPosition(dot, fixedDots, radius, size);
      canvas.drawCircle(adjustedDot, radius, paint);
    }
  }

  Offset adjustDotPosition(
      Offset dot, List<Offset> existingDots, double radius, Size size) {
    Offset adjustedDot = dot;

    for (final existingDot in existingDots) {
      if (dot != existingDot && (dot - existingDot).distance < 2 * radius) {
        // If the current dot is too close to an existing dot, adjust its position
        double angle = Random().nextDouble() * 2 * pi;
        double distance =
            (2 * radius) + Random().nextDouble() * (size.width / 4);
        double dx = distance * cos(angle);
        double dy = distance * sin(angle);
        adjustedDot = Offset(dot.dx + dx, dot.dy + dy);
      }
    }

    return adjustedDot;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
