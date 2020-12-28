import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';

import '../timer_view_model.dart';

class TimerValueWidget extends StatefulWidget {
  @override
  _TimerValueWidgetState createState() => _TimerValueWidgetState();
}

class _TimerValueWidgetState extends State<TimerValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<TimerViewModel>(context, listen: true).timerValue.toString(),
      style: timerValueTextStyle,
    );
  }

  @override
  void deactivate() {
    Provider.of<TimerViewModel>(context, listen: false).quitGame;
    super.deactivate();
  }
}
