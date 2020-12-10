import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';

import '../home_view_model.dart';

class HighScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
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
              Provider.of<HomeViewModel>(context, listen: true)
                  .highScore
                  .toString(),
              style: highScoreTextStyle.copyWith(fontSize: 30),
            )
          ],
        );
      },
    );
  }
}
