import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/values.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/utils/ui_helper.dart';
import 'package:strooper/utils/ui_utils.dart';

import 'package:strooper/model/game_over.dart';

import 'game_over_view_model.dart';
import 'widgets/game_result_background_painter.dart';

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
                        width: double.infinity,
                        height: getHeight(context, divideBy: 2.1),
                        margin:
                            EdgeInsets.only(bottom: gameOverMenuButtonRadius),
                        child: CustomPaint(
                          painter: GameResultBackgroundPainter(
                              backgroundColor: Color(0xffFFFAFA)),
                          child: Container(
                            padding: EdgeInsets.only(bottom: paddingMedium),
                            child: scoreDetails.isHighest
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ...getScoreWidget(
                                        title: 'New Highest',
                                        value: '${scoreDetails.highScore}',
                                        color: Colors.green,
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ...getScoreWidget(
                                        title: 'Your Score',
                                        value: '${scoreDetails.newScore}',
                                        color: Colors.red,
                                      ),
                                      verticalSpacingNormal,
                                      ...getScoreWidget(
                                        title: 'Highest',
                                        value: '${scoreDetails.highScore}',
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                          ),
                        ),
                      ),

                      // Menu Button [Bake to Home] and [Restart Game]
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Go back to [Home]
                          BounceAnimation(
                            duration: gotoHomeButtonAnimationDuration,
                            onTap: () {
                              model.goBack();
                            },
                            bounceWidget: SvgPicture.asset(
                              "images/home_button.svg",
                              height: gameOverMenuButtonRadius * 2,
                            ),
                          ),

                          horizontalSpacingMedium,

                          // Restart game
                          BounceAnimation(
                            duration: restartButtonAnimationDuration,
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

  List<Widget> getScoreWidget({
    @required String title,
    @required String value,
    Color color = Colors.black,
  }) {
    List<Widget> list = List<Widget>();
    list.add(
      Text(
        title,
        style: gameOverScoreTitleTextStyle.copyWith(color: color),
      ),
    );
    list.add(
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: FittedBox(
          child: Text(
            value,
            style: gameOverScoreValueTextStyle,
          ),
        ),
      ),
    );
    return list;
  }
}
