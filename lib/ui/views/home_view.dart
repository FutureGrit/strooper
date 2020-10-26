import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/ui/widgets/app_bar_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // TODO: Pre load all required image assets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: appBackgroundDecoration,
        child: Column(
          children: [
            AppBarWidget(),
            // TODO: Add app name image "STROOPER"
            // TODO: Add "START" button
            // TODO: Add "Clouds"
          ],
        ),
      ),
    );
  }
}
