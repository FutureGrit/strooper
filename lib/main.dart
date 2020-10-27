import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'file:///D:/Flutter/Projects/strooper/lib/home/home_view.dart';

void main() {
  runApp(Strooper());
}

class Strooper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hide status bar and enable full screen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: HomeView(),
    );
  }
}
