import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/utils/ui_utils.dart';

import 'question_view_model.dart';
import 'widgets/answer_buttons_widgets.dart';
import 'widgets/game_body_widget.dart';
import 'widgets/new_score_widget.dart';

class PlayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('[1]-------- PlayView Rebuilding --------');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: paddingMedium, horizontal: paddingLarge),
          decoration: appBackgroundDecoration,
          child: ChangeNotifierProvider(
            create: (context) => QuestionViewModel(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NewScoreWidget(),
                  GameBodyWidget(),
                  AnswerButtonsWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
