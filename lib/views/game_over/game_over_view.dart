import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/helpers/popup_background_painter.dart';
import 'package:strooper/helpers/ui_helper.dart';
import 'package:strooper/model/game_over.dart';
import 'package:strooper/services/sounds/sound_methods.dart';
import 'package:strooper/views/game_over/game_over_view_model.dart';

class GameOverView extends StatelessWidget {
  GameOverView({this.scoreDetails});

  final GameOver scoreDetails;
  @override
  Widget build(BuildContext context) {
    debugPrint('[10]-------- GameOverView Rebuilding --------');
    return Scaffold(
      body: ChangeNotifierProvider<GameOverViewModel>(
        create: (context) => GameOverViewModel(),
        child: Consumer<GameOverViewModel>(
          builder: (context, model, child) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: paddingMedium, horizontal: paddingLarge),
              alignment: AlignmentDirectional.center,
              decoration: appBackgroundDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "images/game_over.svg",
                    width: getWidth(context) - paddingLarge * 2,
                  ),
                  verticalSpacingMedium,
                  Stack(
                    overflow: Overflow.visible,
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(bottom: gameOverMenuButtonRadius),
                        width: double.infinity,
                        height: getHeight(context, divideBy: 2.1),
                        child: CustomPaint(
                          painter: PopupBackgroundPainter(
                              backgroundColor: Color(0xffFFFAFA)),
                          child: Container(
                            padding: EdgeInsets.only(bottom: paddingMedium),
                            child: scoreDetails.isHighest
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'New Highest Score',
                                        style: TextStyle(
                                            color: Colors.green[800],
                                            fontSize: 28),
                                      ),
                                      Text(
                                        '${scoreDetails.highScore}',
                                        style: TextStyle(
                                            color: Colors.green[800],
                                            fontSize: 40),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Your Score',
                                        style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 26),
                                      ),
                                      Text(
                                        '${scoreDetails.newScore}',
                                        style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 36),
                                      ),
                                      SizedBox(height: 40),
                                      Text(
                                        'Highest Score',
                                        style: TextStyle(
                                            color: Colors.green[800],
                                            fontSize: 16),
                                      ),
                                      Text(
                                        scoreDetails.highScore.toString(),
                                        style: TextStyle(
                                            color: Colors.green[800],
                                            fontSize: 32),
                                      )
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BounceAnimation(
                            duration: 100,
                            onTap: () {
                              model.goBack();
                            },
                            bounceWidget: SvgPicture.asset(
                              "images/home_button.svg",
                              height: gameOverMenuButtonRadius * 2,
                            ),
                          ),
                          SizedBox(width: 20),
                          BounceAnimation(
                            duration: 100,
                            onTap: () {
                              model.restartGame();
                            },
                            bounceWidget: SvgPicture.asset(
                              "images/restart_button.svg",
                              height: gameOverMenuButtonRadius * 2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
