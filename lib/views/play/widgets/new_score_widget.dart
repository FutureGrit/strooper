import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/strings.dart';

import '../question_view_model.dart';

class NewScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionViewModel>(
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score, style: highScoreTextStyle),
            Text(
              model.score.toString(),
              style: newScoreTextStyle,
            )
          ],
        );
      },
    );
  }
}
