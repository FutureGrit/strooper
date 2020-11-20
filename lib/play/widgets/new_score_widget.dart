import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';

class NewScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Score',
            style: highScoreTextStyle,
          ),
          Text(
            // TODO: Get high score from local DB
            "18",
            style: highScoreTextStyle.copyWith(fontSize: 36),
          )
        ],
      ),
    );
  }
}
