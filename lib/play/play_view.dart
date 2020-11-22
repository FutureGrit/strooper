import 'package:flutter/material.dart';
import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/home/score_view_model.dart';
import 'package:strooper/locator.dart';
import 'package:strooper/play/widgets/answer_buttons_widgets.dart';
import 'package:strooper/play/widgets/game_body_widget.dart';
import 'package:strooper/play/widgets/new_score_widget.dart';

class PlayView extends StatelessWidget {
  // TODO: remove scoreViewModel because score will be checked and saved only form game over screen.
  final ScoreViewModel model = locator<ScoreViewModel>();

  @override
  Widget build(BuildContext context) {
    //TODO: PlayViewModel will be use here
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingMedium, horizontal: paddingLarge),
        decoration: appBackgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [NewScoreWidget(), GameBodyWidget(), AnswerButtonsWidget()],
        ),
      ),
    );
  }
}
