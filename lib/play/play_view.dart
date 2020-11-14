import 'package:flutter/material.dart';
import 'package:strooper/home/score_view_model.dart';
import 'package:strooper/locator.dart';

class PlayView extends StatelessWidget {
  // TODO: remove scoreViewModel because score will be checked and saved only form game over screen.
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
                model.checkScore(newScore: 2088);
                // result
                //     ? debugPrint('High Score 120 is saved')
                //     : debugPrint('Low Score! Play Again.');
              },
              child: Text('High Score: 2088'),
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () {
                // bool result =
                // Provider.of<PlayViewModel>(context, listen: false)
                //     .checkAnswer(288);
                model.checkScore(newScore: 2060);
                // result
                //     ? debugPrint('High Score 120 is saved')
                //     : debugPrint('Low Score! Play Again.');
              },
              child: Text('Low Score: 2060'),
            ),
          ],
        ),
      ),
    );
  }
}
