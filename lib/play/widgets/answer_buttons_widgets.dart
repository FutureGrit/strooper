import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/bounce_animation.dart';

class AnswerButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BounceAnimation(
            onTap: () {
              print("^^^^^^^^^^^^^ Wrong Answer N ^^^^^^^^^^^^^^^");
            },
            bounceWidget: SvgPicture.asset(
              'images/answer_wrong.svg',
              width: (MediaQuery.of(context).size.width / 2.1) - paddingLarge,
            ),
          ),
          BounceAnimation(
            onTap: () {
              print("^^^^^^^^^^^^^ Right Answer Y ^^^^^^^^^^^^^^^");
            },
            bounceWidget: SvgPicture.asset(
              'images/answer_right.svg',
              width: (MediaQuery.of(context).size.width / 2.1) - paddingLarge,
            ),
          )
        ],
      ),
    );
  }
}
