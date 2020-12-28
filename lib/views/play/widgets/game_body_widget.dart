import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/utils/methods.dart';
import 'package:strooper/utils/ui_utils.dart';

import 'countdown_timer_widget.dart';
import 'question_text_widget.dart';

class GameBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: countdownWidgetRadius),
          padding: EdgeInsets.only(
            top: paddingNormal,
            left: paddingNormal,
            right: paddingNormal,
            bottom: countdownWidgetRadius - paddingNormal,
          ),
          decoration: questionBoardBoxDecoration,
          width: double.infinity,
          height: Methods.getHeight(context, divideBy: 4),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: QuestionTextWidget(),
          ),
        ),

        /// Timer widget starts here
        Positioned(
          left: paddingNormal,
          right: paddingNormal,
          child: CountdownTimerWidget(),
        )
      ],
    );
  }
}
