import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/popup_background_painter.dart';
import 'package:strooper/model/game_over.dart';

class GameOverView extends StatelessWidget {
  GameOverView({this.scoreDetails});

  final GameOver scoreDetails;
  @override
  Widget build(BuildContext context) {
    debugPrint('[10]-------- GameOverView Rebuilding --------');
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: paddingMedium, horizontal: paddingLarge),
          alignment: AlignmentDirectional.center,
          decoration: appBackgroundDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "images/game_over.svg",
                width: (MediaQuery.of(context).size.width) - paddingLarge * 2,
              ),
              verticalSpacingMedium,
              Stack(
                overflow: Overflow.visible,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: countdownWidgetRadius),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.1,
                    child: CustomPaint(
                      painter: PopupBackgroundPainter(
                          backgroundColor: Color(0xffFFFAFA)),
                      child: Container(
                        padding: EdgeInsets.only(bottom: paddingMedium),
                        child: scoreDetails.isHighest
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'New Highest Score',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 28),
                                  ),
                                  Text(
                                    '${scoreDetails.highScore}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Score',
                                    style: TextStyle(
                                        color: Colors.red[800], fontSize: 26),
                                  ),
                                  Text(
                                    '${scoreDetails.newScore}',
                                    style: TextStyle(
                                        color: Colors.red[800], fontSize: 36),
                                  ),
                                  SizedBox(height: 40),
                                  Text(
                                    'Highest Score',
                                    style: TextStyle(
                                        color: Colors.green[800], fontSize: 16),
                                  ),
                                  Text(
                                    scoreDetails.highScore.toString(),
                                    style: TextStyle(
                                        color: Colors.green[800], fontSize: 32),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "images/home_button.svg",
                        width: (MediaQuery.of(context).size.width / 3) -
                            paddingLarge,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        "images/restart_button.svg",
                        width: (MediaQuery.of(context).size.width / 3) -
                            paddingLarge,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
