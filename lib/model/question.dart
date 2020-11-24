import 'package:flutter/cupertino.dart';

class Question {
  String colorName;
  Color color;
  bool answer;

  Question({
    @required this.colorName,
    @required this.color,
    @required this.answer,
  });
}
