import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/play/question_view_model.dart';

class NewScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionViewModel>(
      builder: (context, model, child) {
        debugPrint("[2]-------- NewScoreWidget Rebuilding --------");
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score',
                style: highScoreTextStyle,
              ),
              Text(
                model.score.toString(),
                //TODO: set style const
                style: highScoreTextStyle.copyWith(fontSize: 36),
              )
            ],
          ),
        );
      },
    );
  }
}
