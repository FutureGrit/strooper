import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:strooper/home/home_view_model.dart';

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
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: HomeView(),
      ),
    );
  }
}
