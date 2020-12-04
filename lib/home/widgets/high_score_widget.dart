import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/home/high_score_view_model.dart';

class HighScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HighScoreViewModel>(
      create: (context) => HighScoreViewModel(),
      child: Consumer<HighScoreViewModel>(
        builder: (context, model, child) {
          debugPrint(
              '[0]-------- HighScoreWidget Rebuilding: ${model.highScore} --------');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'High Score',
                style: highScoreTextStyle,
              ),
              Text(
                // TODO: Get high score from local DB
                Provider.of<HighScoreViewModel>(context, listen: true)
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
