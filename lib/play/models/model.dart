import 'package:flutter/material.dart';

class TextItem {
  /// Text
  final Text text;

  /// Space between characters
  final double space;

  /// Text starting position
  final double startAngle;

  TextItem({
    @required this.text,
    this.space = 13,
    this.startAngle = 90,
  })  : assert(text != null),
        assert(space != null && space >= 0),
        assert(startAngle != null);

  bool isChanged(TextItem oldTextItem) {
    bool isTextChanged() {
      return oldTextItem.text.data != text.data ||
          oldTextItem.text.style != text.style;
    }

    return isTextChanged() ||
        oldTextItem.space != space ||
        oldTextItem.startAngle != startAngle;
  }
}
