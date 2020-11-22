import 'dart:math';
import 'package:strooper/constants/ui_utils.dart';

import 'model.dart';
import 'package:flutter/material.dart';

class CircularText extends StatelessWidget {
  ///Circle text
  final TextItem childText;

  /// Circle radius
  final double radius = countdownWidgetRadius;

  /// Background paint
  final Paint backgroundPaint;

  CircularText({
    Key key,
    @required this.childText,
    Paint backgroundPaint,
  })  : assert(childText != null),
        this.backgroundPaint = backgroundPaint ??
            (backgroundPaint = Paint()..color = Colors.transparent),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox.fromSize(
        size: Size(2 * radius, 2 * radius),
        child: CustomPaint(
          painter: _CircularTextPainter(
            childText: childText,
            backgroundPaint: backgroundPaint,
            textDirection: Directionality.of(context),
          ),
        ),
      ),
    );
  }
}

class _CircularTextPainter extends CustomPainter {
  final TextItem childText;
  final Paint backgroundPaint;
  final TextDirection textDirection;

  double _radius = 0.0;

  _CircularTextPainter({
    this.childText,
    this.backgroundPaint,
    this.textDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _radius = min(size.width / 2, size.height / 2);
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, _radius, backgroundPaint);

    canvas.save();
    List<TextPainter> _charPainters = [];
    Text text = childText.text;
    for (final char in text.data.split("")) {
      _charPainters.add(TextPainter(
          text: TextSpan(text: char, style: text.style),
          textDirection: textDirection)
        ..layout());
    }
    _paintTextAntiClockwise(canvas, size, childText, _charPainters);
    canvas.restore();
  }

  void _paintTextAntiClockwise(Canvas canvas, Size size, TextItem textItem,
      List<TextPainter> _charPainters) {
    bool hasStrokeStyle = backgroundPaint.style == PaintingStyle.stroke &&
        backgroundPaint.strokeWidth > 0.0;

    double angleShift = _calculateAngleShift(textItem, _charPainters.length);
    canvas.rotate((textItem.startAngle - 90 + angleShift) * pi / 180);
    for (int i = 0; i < _charPainters.length; i++) {
      final tp = _charPainters[i];
      final x = -tp.width / 2;
      final y =
          _radius + (hasStrokeStyle ? backgroundPaint.strokeWidth / 2 : 0.0);

      tp.paint(canvas, Offset(x, y));
      canvas.rotate(-textItem.space * pi / 180);
    }
  }

  double _calculateAngleShift(TextItem textItem, int textLength) {
    double angleShift = -1;
    int halfItemsLength = textLength ~/ 2;
    if (textLength % 2 == 0) {
      angleShift =
          ((halfItemsLength - 1) * textItem.space) + (textItem.space / 2);
    } else {
      angleShift = (halfItemsLength * textItem.space);
    }
    return angleShift;
  }

  @override
  bool shouldRepaint(_CircularTextPainter oldDelegate) {
    bool isTextItemsChanged() {
      bool isChanged = false;
      if (childText.isChanged(oldDelegate.childText)) {
        isChanged = true;
      }
      return isChanged;
    }

    bool isBackgroundPaintChanged() {
      return oldDelegate.backgroundPaint.color != backgroundPaint.color ||
          oldDelegate.backgroundPaint.style != backgroundPaint.style ||
          oldDelegate.backgroundPaint.strokeWidth !=
              backgroundPaint.strokeWidth;
    }

    return isTextItemsChanged() ||
        oldDelegate.textDirection != textDirection ||
        isBackgroundPaintChanged();
  }
}
