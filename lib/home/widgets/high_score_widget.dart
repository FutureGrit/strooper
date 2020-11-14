import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/home/score_view_model.dart';
import 'package:strooper/locator.dart';

class HighScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      //TODO: as ChangeNotifierProvider.value provide existing changeNotifier so we can try to us this else where
      value: locator<ScoreViewModel>(),
      child: Consumer<ScoreViewModel>(
        builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'High Score',
                style: highScoreTextStyle,
              ),
              Text(
                // TODO: Get high score from local DB
                Provider.of<ScoreViewModel>(context, listen: false)
                    .highScore
                    .toString(),
                style: highScoreTextStyle.copyWith(fontSize: 30),
              )
            ],
          );
        },
      ),
    );
  }
}
