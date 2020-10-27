import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:strooper/constants/shared_style.dart';
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
            SvgPicture.asset(
              'images/app_title.svg',
              // TODO: Move media query in [ui_helper] file
              width: MediaQuery.of(context).size.width / 1.3,
            ),
            GestureDetector(
              onTap: () {
                // TODO: Navigate to [Play] screen
                print('START Button tapped');
              },
              child: SvgPicture.asset(
                'images/start_button.svg',
                width: MediaQuery.of(context).size.width / 2.2,
              ),
            ),
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
