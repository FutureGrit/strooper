import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../timer_view_model.dart';

class TimerValueWidget extends StatefulWidget {
  @override
  _TimerValueWidgetState createState() => _TimerValueWidgetState();
}

class _TimerValueWidgetState extends State<TimerValueWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint('[6]-------- TimerValueWidget Rebuilding --------');
    return Text(
      Provider.of<TimerViewModel>(context, listen: true).timerValue.toString(),
      //TODO: set text style const
      style: TextStyle(fontSize: 26, color: Colors.white),
    );
  }

  @override
  void deactivate() {
    Provider.of<TimerViewModel>(context, listen: false).quitGame;
    super.deactivate();
  }
}
