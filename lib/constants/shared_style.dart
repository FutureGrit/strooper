import 'package:flutter/material.dart';

import 'package:strooper/constants/app_colors.dart';

// ---- Gradient Background Decoration ----
const appBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [gradientColorBlue, gradientColorPurple]),
);
