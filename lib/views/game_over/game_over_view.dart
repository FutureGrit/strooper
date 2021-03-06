import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:strooper/constants/app_colors.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/strings.dart';
import 'package:strooper/constants/values.dart';
import 'package:strooper/enums/game_images.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/helpers/one_tap_recognizer.dart';
import 'package:strooper/utils/methods.dart';
import 'package:strooper/utils/ui_utils.dart';

import 'package:strooper/model/game_over.dart';

import 'game_over_view_model.dart';
import 'widgets/game_result_background_painter.dart';

class GameOverView extends StatelessWidget {
  GameOverView({this.scoreDetails});

  final GameOver scoreDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<GameOverViewModel>(
        create: (context) => GameOverViewModel(),
        child: Consumer<GameOverViewModel>(
          builder: (context, model, child) {
            return OneTapRecognizerWidget(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: paddingMedium, horizontal: paddingLarge),
                alignment: AlignmentDirectional.center,
                decoration: appBackgroundDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.memory(
                      Methods.getImageData(imageType: GameImages.GAME_OVER),
                      width: Methods.getWidth(context) - paddingLarge * 2,
                      semanticsLabel: "Game Over",
                    ),
                    verticalSpacingMedium,
                    Stack(
                      overflow: Overflow.visible,
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight:
                                Methods.getHeight(context, divideBy: 2.1),
                          ),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                bottom: gameOverMenuButtonRadius),
                            child: CustomPaint(
                              painter: GameResultBackgroundPainter(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    paddingMedium,
                                    paddingMedium,
                                    paddingMedium,
                                    gameOverMenuButtonRadius),
                                child: scoreDetails.isHighest
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ...getScoreWidget(
                                            title: newHighestScore,
                                            value: '${scoreDetails.highScore}',
                                            color: newHighestScoreTextColor,
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ...getScoreWidget(
                                            title: yourScore,
                                            value: '${scoreDetails.newScore}',
                                            color: yourScoreTextColor,
                                          ),
                                          verticalSpacingNormal,
                                          ...getScoreWidget(
                                            title: highest,
                                            value: '${scoreDetails.highScore}',
                                            color: newHighestScoreTextColor,
                                          )
                                        ],
                                      ),
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
                              bounceWidget: SvgPicture.memory(
                                Methods.getImageData(
                                    imageType: GameImages.GOTO_HOME),
                                height: gameOverMenuButtonRadius * 2,
                                semanticsLabel: "Goto Home Screen",
                              ),
                            ),

                            horizontalSpacingMedium,

                            // Restart game
                            BounceAnimation(
                              duration: restartButtonAnimationDuration,
                              onTap: () {
                                model.restartGame();
                              },
                              bounceWidget: SvgPicture.memory(
                                Methods.getImageData(
                                    imageType: GameImages.RESTART_GAME),
                                height: gameOverMenuButtonRadius * 2,
                                semanticsLabel: "Restart Game",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
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
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
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
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
    return list;
  }
}
