import 'dart:math';

import 'package:flutter/material.dart';

class CircularStatus extends CustomPainter {
  CircularStatus({required this.color, this.count = 9});

  Color color = Colors.black;
  int count;

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 2
      ..color = color
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) + 3;
    double angleInt = 360 / count;
    double angle = ((angleInt - (count > 1 ? 8 : 0)) / 360) * (2 * pi);

    List.generate(count, (index) {
      double startAngleInt = 272 + (angleInt * (index + 1));
      double startAngle = (startAngleInt / 360) * (2 * pi);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        angle,
        false,
        outerCircle,
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
