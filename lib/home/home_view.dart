import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/helpers/bounce_animation.dart';

import 'package:strooper/home/widgets/app_bar_widget.dart';
import 'package:strooper/home/widgets/cloud_widget.dart';
import 'package:strooper/play/play_view.dart';
import 'package:strooper/services/sounds/sound_methods.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  SoundMethods.playButtonSound(
                      action: StrooperActions.START_GAME);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayView()),
                  );
                },
                // TODO: add duration parameter
              ),

              // Clouds and "@FutureGrit" label
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CloudWidget(),
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
