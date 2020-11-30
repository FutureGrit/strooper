import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/play/question_view_model.dart';
import 'package:strooper/play/widgets/answer_buttons_widgets.dart';
import 'package:strooper/play/widgets/game_body_widget.dart';
import 'package:strooper/play/widgets/new_score_widget.dart';

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
    );
  }
}
