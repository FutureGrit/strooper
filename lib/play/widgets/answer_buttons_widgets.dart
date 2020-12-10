import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/helpers/one_tap_recognizer.dart';
import 'package:strooper/helpers/ui_helper.dart';
import 'package:strooper/play/question_view_model.dart';

class AnswerButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('[7]-------- AnswerButtonWidget Rebuilding -------');
    return OneTapRecognizerWidget(
      child: Container(
        margin: EdgeInsets.only(bottom: marginLarge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _answerButtonType(
              value: false,
              imagePath: 'images/answer_wrong.svg',
              buildContext: context,
            ),
            _answerButtonType(
              value: true,
              imagePath: 'images/answer_right.svg',
              buildContext: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerButtonType({
    @required bool value,
    @required String imagePath,
    @required BuildContext buildContext,
  }) {
    return BounceAnimation(
      disableLongPress: true,
      duration: 80,
      onTap: () {
        Provider.of<QuestionViewModel>(buildContext, listen: false)
            .checkAnswer(value);
      },
      bounceWidget: SvgPicture.asset(
        imagePath,
        width: getWidth(buildContext, divideBy: 2.1) - paddingLarge,
      ),
    );
  }
}
