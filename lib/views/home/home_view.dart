import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/values.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/utils/ui_helper.dart';
import 'package:strooper/utils/ui_utils.dart';

import 'home_view_model.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/cloud_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('[HO1]-------- HomeView Rebuilding --------');
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      builder: (context, child) {
        print('[HO*]-------- HomeView Rebuilding --------');
        return WillPopScope(
          onWillPop: () async => _onBackPressed(buildContext: context),
          child: Scaffold(
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
                    width: getWidth(context, divideBy: 1.3),
                  ),

                  // Start button
                  BounceAnimation(
                    duration: startButtonAnimationDuration,
                    bounceWidget: SvgPicture.asset(
                      'images/start_button.svg',
                      width: getWidth(context, divideBy: 2),
                    ),
                    onTap: () {
                      Provider.of<HomeViewModel>(context, listen: false)
                          .startGame();
                    },
                  ),

                  // Clouds and "@FutureGrit" label
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: getHeight(context, divideBy: 4),
                        width: getWidth(context),
                        child: CloudWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(paddingSmall),
                        child: Text(
                          '@FutureGrit',
                          style: watermarkStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Confirmation alert dialog to exit from game, when back button is pressed
  Future<bool> _onBackPressed({@required BuildContext buildContext}) {
    return showDialog(
      context: buildContext,
      builder: (context) => AlertDialog(
        title: Text('Warning'),
        content: Text('Do you really want to exit from STROOPER Game?'),
        actions: [
          FlatButton(
            child: Text('YES'),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            child: Text('NO'),
            onPressed: () => Navigator.pop(context, false),
          )
        ],
      ),
    );
  }
}
