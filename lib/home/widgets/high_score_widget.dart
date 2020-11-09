import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/home/home_view_model.dart';

class HighScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'High Score',
          style: highScoreTextStyle,
        ),
        Text(
          // TODO: Get high score from local DB
          Provider.of<HomeViewModel>(context, listen: false)
              .highScore
              .toString(),
          style: highScoreTextStyle.copyWith(fontSize: 30),
        ),
      ],
    );
  }
}
