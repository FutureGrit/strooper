import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/home_view.dart';

void main() {
  runApp(Strooper());
}

class Strooper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hide status bar and enable full screen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      theme: ThemeData(fontFamily: 'FredokaOne'),
      home: HomeView(),
    );
  }
}
