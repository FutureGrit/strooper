import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/helpers/bounce_button.dart';
import 'package:strooper/home/widgets/app_bar_widget.dart';
import 'package:strooper/home/widgets/cloud_widget.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarWidget(),

            // App title "STROOPER"
            SvgPicture.asset(
              'images/app_title.svg',
              // TODO: Move media query in [ui_helper] file
              width: MediaQuery.of(context).size.width / 1.3,
            ),

            // Start button
            BounceAnimation(
              bounceWidget: SvgPicture.asset(
                'images/start_button.svg',
                width: MediaQuery.of(context).size.width / 2.2,
              ),
              onTap: () {
                print('Navigating to PLAY Screen.');
              },
            ),

            // Clouds
            CloudWidget(),
            // TODO: Add app name image "STROOPER"
            // TODO: Add "START" button
            // TODO: Add "Clouds"
          ],
        ),
      ),
    );
  }
}
