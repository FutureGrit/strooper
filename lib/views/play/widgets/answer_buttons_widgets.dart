import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:strooper/constants/values.dart';
import 'package:strooper/enums/game_images.dart';

import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/helpers/one_tap_recognizer.dart';
import 'package:strooper/utils/methods.dart';
import 'package:strooper/utils/ui_utils.dart';

import '../question_view_model.dart';

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
              imageType: GameImages.ANSWER_WRONG,
              buildContext: context,
            ),
            _answerButtonType(
              value: true,
              imageType: GameImages.ANSWER_RIGHT,
              buildContext: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerButtonType({
    @required bool value,
    @required GameImages imageType,
    @required BuildContext buildContext,
  }) {
    return BounceAnimation(
      disableLongPress: true,
      duration: answerButtonAnimationDuration,
      onTap: () {
        Provider.of<QuestionViewModel>(buildContext, listen: false)
            .checkAnswer(value);
      },
      bounceWidget: SvgPicture.memory(
        Methods.getImageData(imageType: imageType),
        width: Methods.getWidth(buildContext, divideBy: 2.1) - paddingLarge,
      ),
    );
  }
}
