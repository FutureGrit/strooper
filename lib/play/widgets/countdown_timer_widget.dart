import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/play/timer_view_model.dart';
import 'package:strooper/play/widgets/timer_value.dart';

class CountdownTimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('[5]-------- CountdownTimerWidget rebuilding --------');
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircularText(
          radius: countdownWidgetRadius,
          position: CircularTextPosition.outside,
          children: [
            TextItem(
              text: Text(
                "Timer".toUpperCase(),
                style: TextStyle(
                    fontSize: 9, color: Colors.white, fontFamily: "FredokaOne"),
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
          child: TimerValue(),
        )
      ],
    );
  }
}
