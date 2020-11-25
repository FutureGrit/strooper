import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/play/only_one_pointer_recognizer.dart';
import 'package:strooper/play/play_view_model.dart';

class AnswerButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("------------ Rebuild Answer Button -----------------");
    return OnlyOnePointerRecognizerWidget(
      child: Container(
        margin: EdgeInsets.only(bottom: marginLarge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BounceAnimation(
              onTap: () {
                debugPrint(
                    '##########---- Wrong Button Tapped: Button disabled -------##########');
                Provider.of<PlayViewModel>(context, listen: false)
                    .checkAnswer(false);
              },
              bounceWidget: SvgPicture.asset(
                'images/answer_wrong.svg',
                width: (MediaQuery.of(context).size.width / 2.1) - paddingLarge,
              ),
            ),
            BounceAnimation(
              onTap: () {
                debugPrint(
                    '##########---- Right Button Tapped: Button disabled -------##########');
                Provider.of<PlayViewModel>(context, listen: false)
                    .checkAnswer(true);
              },
              bounceWidget: SvgPicture.asset(
                'images/answer_right.svg',
                width: (MediaQuery.of(context).size.width / 2.1) - paddingLarge,
              ),
            )
          ],
        ),
      ),
    );
    //   },
    // );
  }
}
