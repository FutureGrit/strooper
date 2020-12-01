import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/views/game_over/game_over_view_model.dart';

class GameOverView extends StatelessWidget {
  final int score;
  GameOverView({this.score = 0});

  @override
  Widget build(BuildContext context) {
    print('[10]-------- GameOverView Rebuilding --------');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingMedium, horizontal: paddingLarge),
        decoration: appBackgroundDecoration,
        // TODO: We don't need ChangeNotifierProvider. Use other provider
        child: Provider(
          create: (context) => GameOverViewModel(),
          child: Consumer<GameOverViewModel>(
            builder: (context, model, child) {
              return Center(
                  child: model.checkScore(score)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'New Highest Score',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                            ),
                            Text(
                              '$score',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 36),
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
                                  color: Colors.red[800], fontSize: 16),
                            ),
                            Text(
                              '$score',
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
                              model.highScore.toString(),
                              style: TextStyle(
                                  color: Colors.green[800], fontSize: 36),
                            )
                          ],
                        ));
            },
          ),
        ),
      ),
    );
  }
}
