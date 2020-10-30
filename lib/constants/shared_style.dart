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
