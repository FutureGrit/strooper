import 'package:flutter/material.dart';

class PopupBackgroundPainter extends CustomPainter {
  PopupBackgroundPainter({this.backgroundColor = Colors.white});

  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

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
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
