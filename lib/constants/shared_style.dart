import 'package:flutter/material.dart';

import 'package:strooper/constants/app_colors.dart';

// ---- Gradient Background Decoration ----
const appBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [gradientColorBlue, gradientColorPurple]),
);

// ---- High Score Text Style ----
const highScoreTextStyle = TextStyle(
  color: highScoreColor,
  fontSize: 14,
);

// ---- Watermark Label Text Style ----
const watermarkStyle = TextStyle(
  color: watermarkColor,
  fontSize: 12,
);

// ---- Instruction screen Style ----
const detailTextStyle = TextStyle(
  fontSize: 21,
  color: Colors.white70,
);
const howToPlayTextStyle = TextStyle(fontSize: 28, color: Colors.white);
const howToPlayDecoration = BoxDecoration(
  color: Color(0x38ffffff),
  borderRadius: BorderRadius.horizontal(
    right: Radius.circular(100.0),
  ),
);
const exampleWidgetTextStyle = TextStyle(color: Colors.white);
final exampleWidgetButtonDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xffFFCC00), Color(0xffFF9700)],
  ),
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.circular(8),
);

// ---- Game Over Screen Style ----
const gameOverScoreTitleTextStyle =
    TextStyle(color: Colors.black, fontSize: 28);
const gameOverScoreValueTextStyle =
    TextStyle(color: Colors.white, fontSize: 36);
