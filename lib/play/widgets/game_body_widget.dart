import 'package:flutter/material.dart';

import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/play/widgets/countdown_timer_widget.dart';
import 'package:strooper/play/widgets/question_text_widget.dart';

class GameBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('[3]-------- GameBodyWidget Rebuilding --------');
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
          decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                )
              ]),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
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
