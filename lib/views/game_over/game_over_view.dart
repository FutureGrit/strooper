import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
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
          decoration: appBackgroundDecoration,
          // TODO: We don't need ChangeNotifierProvider. Use other provider
          child: Center(
            child: scoreDetails.isHighest
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'New Highest Score',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      Text(
                        '${scoreDetails.highScore}',
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Your Score',
                        style: TextStyle(color: Colors.red[800], fontSize: 16),
                      ),
                      Text(
                        '${scoreDetails.newScore}',
                        style: TextStyle(color: Colors.red[800], fontSize: 36),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Highest Score',
                        style:
                            TextStyle(color: Colors.green[800], fontSize: 16),
                      ),
                      Text(
                        scoreDetails.highScore.toString(),
                        style:
                            TextStyle(color: Colors.green[800], fontSize: 36),
                      )
                    ],
                  ),
          )),
    );
  }
}
