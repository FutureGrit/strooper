import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strooper/home/score_view_model.dart';
import 'package:strooper/locator.dart';
import 'package:strooper/play/play_view_model.dart';

class PlayView extends StatelessWidget {
  final ScoreViewModel model = locator<ScoreViewModel>();

  @override
  Widget build(BuildContext context) {
    //TODO: PlayViewModel will be use here
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.cyan,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Play Screen'),
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: () {
                // bool result =
                // Provider.of<PlayViewModel>(context, listen: false)
                //     .checkAnswer(1640);
                model.checkScore(newScore: 1940);
                // result
                //     ? debugPrint('High Score 120 is saved')
                //     : debugPrint('Low Score! Play Again.');
              },
              child: Text('High Score: 1940'),
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () {
                // bool result =
                // Provider.of<PlayViewModel>(context, listen: false)
                //     .checkAnswer(288);
                model.checkScore(newScore: 430);
                // result
                //     ? debugPrint('High Score 120 is saved')
                //     : debugPrint('Low Score! Play Again.');
              },
              child: Text('Low Score: 430'),
            ),
          ],
        ),
      ),
    );
  }
}
