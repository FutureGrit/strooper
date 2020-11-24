import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/play/play_view_model.dart';

class NewScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("@@@@@@@@@---- Rebuilding NewScoreWidget ----@@@@@@@@@@@");
    return Consumer<PlayViewModel>(
      builder: (context, model, child) {
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
                //Provider.of<PlayViewModel>(context, listen: false)
                model.newScore.toString(),
                style: highScoreTextStyle.copyWith(fontSize: 36),
              )
            ],
          ),
        );
      },
    );
  }
}
