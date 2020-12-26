import 'package:flutter/material.dart';

import 'package:strooper/constants/app_colors.dart';

class GameResultBackgroundPainter extends CustomPainter {
  GameResultBackgroundPainter(
      {this.backgroundColor = resultBackgroundColor,
      this.borderColor = resultBackgroundBorderColor});

  final Color backgroundColor;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBackground = new Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(getPath(size), paintBackground);

    Paint paintBorder = new Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;
    canvas.drawPath(getPath(size), paintBorder);
  }

  Path getPath(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.09, size.height * 0.10);
    path.quadraticBezierTo(size.width * -0.12, size.height * 0.50,
        size.width * 0.09, size.height * 0.90);
    path.cubicTo(size.width * 0.11, size.height * 0.95, size.width * 0.17,
        size.height * 0.96, size.width * 0.17, size.height * 0.96);
    path.quadraticBezierTo(size.width * 0.49, size.height * 1.04,
        size.width * 0.83, size.height * 0.96);
    path.quadraticBezierTo(size.width * 0.89, size.height * 0.94,
        size.width * 0.91, size.height * 0.90);
    path.quadraticBezierTo(size.width * 1.11, size.height * 0.50,
        size.width * 0.91, size.height * 0.10);
    path.quadraticBezierTo(size.width * 0.89, size.height * 0.06,
        size.width * 0.83, size.height * 0.04);
    path.cubicTo(size.width * 0.50, size.height * -0.04, size.width * 0.30,
        size.height * 0.00, size.width * 0.17, size.height * 0.04);
    path.quadraticBezierTo(size.width * 0.11, size.height * 0.06,
        size.width * 0.09, size.height * 0.10);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
