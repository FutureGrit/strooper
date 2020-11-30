import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/play_service.dart';

class TimerViewModel extends ChangeNotifier {
  TimerViewModel() {
    _playService.updateTimerWidget = () {
      notifyListeners();
    };

    _playService.startTimer();
  }

  final PlayService _playService = locator<PlayService>();

  int get timerValue => _playService.startTimerAt;

  // This will be called just before disposing the timer widget
  void get quitGame => _playService.quitGame();
}
