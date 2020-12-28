import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_circular_text/circular_text.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/strings.dart';
import 'package:strooper/utils/ui_utils.dart';

import '../timer_view_model.dart';
import 'timer_value_widget.dart';

class CountdownTimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircularText(
          radius: countdownWidgetRadius,
          position: CircularTextPosition.outside,
          children: [
            TextItem(
              text: Text(
                timer.toUpperCase(),
                style: timerTextStyle,
              ),
              direction: CircularTextDirection.anticlockwise,
              startAngleAlignment: StartAngleAlignment.center,
              startAngle: 90,
              space: 13,
            ),
          ],
        ),

        /// Countdown background
        Container(
          height: (countdownWidgetRadius * 2) - backgroundAndTimerSpacing,
          width: (countdownWidgetRadius * 2) - backgroundAndTimerSpacing,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 1,
              colors: [Color(0xffE95059), Color(0xff861960)],
              stops: [.3, .6],
              center: Alignment(0.1, -0.5),
            ),
          ),
        ),

        /// Countdown timer value status
        ChangeNotifierProvider(
          create: (context) => TimerViewModel(),
          child: TimerValueWidget(),
        )
      ],
    );
  }
}
