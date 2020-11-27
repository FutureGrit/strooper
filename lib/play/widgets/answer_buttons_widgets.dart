import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/play/only_one_pointer_recognizer.dart';
import 'package:strooper/play/play_view_model.dart';
import 'package:strooper/services/sounds/sound_methods.dart';

class AnswerButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnlyOnePointerRecognizerWidget(
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
        SoundMethods.playButtonSound(action: StrooperActions.ANSWER_BUTTON);
        Provider.of<PlayViewModel>(buildContext, listen: false)
            .checkAnswer(value);
      },
      bounceWidget: SvgPicture.asset(
        imagePath,
        width: (MediaQuery.of(buildContext).size.width / 2.1) - paddingLarge,
      ),
    );
  }
}
