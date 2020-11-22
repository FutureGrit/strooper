import 'package:flutter/material.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/play/models/model.dart';
import 'package:strooper/play/models/widget.dart';

class CountdownTimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircularText(
          childText: TextItem(
            text: Text(
              "Timer".toUpperCase(),
              style: TextStyle(
                  fontSize: 9, color: Colors.white, fontFamily: "FredokaOne"),
            ),
          ),
        ),

        /// Countdown background starts here
        Container(
          height: (countdownWidgetRadius * 2) - backgroundAndTimerSpacing,
          width: (countdownWidgetRadius * 2) - backgroundAndTimerSpacing,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 1,
              colors: [Color(0xffE95059), Color(0xff861960)],
              stops: [.3, .6],
              center: Alignment(0.1, -0.5), //.2, -0.8
            ),
          ),
        ),
        Text(
          "2",
          //TODO: set text style const
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ],
    );
  }
}
