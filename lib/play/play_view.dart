import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/home/score_view_model.dart';
import 'package:strooper/locator.dart';
import 'package:strooper/play/models/model.dart';
import 'package:strooper/play/models/widget.dart';
import 'package:strooper/play/widgets/new_score_widget.dart';

import 'models/arc_text.dart';

class PlayView extends StatelessWidget {
  // TODO: remove scoreViewModel because score will be checked and saved only form game over screen.
  final ScoreViewModel model = locator<ScoreViewModel>();

  @override
  Widget build(BuildContext context) {
    //TODO: PlayViewModel will be use here
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingMedium, horizontal: paddingLarge),
        decoration: appBackgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NewScoreWidget(),
            Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 16, vertical: c),
                  margin: EdgeInsets.only(bottom: countdownWidgetRadius),
                  padding: EdgeInsets.only(
                    top: paddingNormal,
                    left: paddingNormal,
                    right: paddingNormal,
                    bottom: countdownWidgetRadius - paddingNormal,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: const Offset(0.0, 10.0),
                        )
                      ]),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  //TODO: Remove below container not it's child
                  child: Container(
                    alignment: Alignment.center,
                    //color: Colors.red,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Yellow".toUpperCase(),
                        style: TextStyle(
                          fontSize: 52.0,
                          fontFamily: "Bungee",
                        ),
                      ),
                    ),
                  ),
                ),

                /// Timer widget starts here
                Positioned(
                  left: paddingNormal,
                  right: paddingNormal,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircularText(children: [
                        TextItem(
                          text: Text(
                            "Timer".toUpperCase(),
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                                fontFamily: "FredokaOne"),
                          ),
                          space: 13,
                          startAngle: 90,
                          startAngleAlignment: StartAngleAlignment.center,
                          direction: CircularTextDirection.anticlockwise,
                        ),
                      ]),

                      /// Countdown background starts here
                      Container(
                        height: (countdownWidgetRadius - paddingNormal) * 2,
                        width: (countdownWidgetRadius - paddingNormal) * 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            radius: 1,
                            colors: [Color(0xffE95059), Color(0xff861960)],
                            stops: [.3, .6],
                            center: Alignment(0.1, -0.5), //.2, -0.8
                          ),
                        ),
                      ),
                      Text(
                        "2",
                        //TODO: set text style const
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: marginLarge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BounceAnimation(
                    onTap: () {
                      print("^^^^^^^^^^^^^ Wrong Answer ^^^^^^^^^^^^^^^");
                    },
                    bounceWidget: SvgPicture.asset(
                      'images/answer_wrong.svg',
                      width: (MediaQuery.of(context).size.width / 2.1) -
                          paddingLarge,
                    ),
                  ),
                  BounceAnimation(
                    onTap: () {
                      print(
                          "^^^^^^^^^^^^^ Right Answer Kanishk ^^^^^^^^^^^^^^^");
                    },
                    bounceWidget: SvgPicture.asset(
                      'images/answer_right.svg',
                      width: (MediaQuery.of(context).size.width / 2.1) -
                          paddingLarge,
                    ),
                  )
                ],
              ),
            )
            // MaterialButton(
            //   color: Colors.pinkAccent,
            //   onPressed: () {
            //     // bool result =
            //     // Provider.of<PlayViewModel>(context, listen: false)
            //     //     .checkAnswer(1640);
            //     model.checkScore(newScore: 2088);
            //     // result
            //     //     ? debugPrint('High Score 120 is saved')
            //     //     : debugPrint('Low Score! Play Again.');
            //   },
            //   child: Text('High Score: 2088'),
            // ),
            // MaterialButton(
            //   color: Colors.amberAccent,
            //   onPressed: () {
            //     // bool result =
            //     // Provider.of<PlayViewModel>(context, listen: false)
            //     //     .checkAnswer(288);
            //     model.checkScore(newScore: 2060);
            //     // result
            //     //     ? debugPrint('High Score 120 is saved')
            //     //     : debugPrint('Low Score! Play Again.');
            //   },
            //   child: Text('Low Score: 2060'),
            // ),
          ],
        ),
      ),
    );
  }
}
