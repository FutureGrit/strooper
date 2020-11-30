import 'dart:async';
import 'dart:math';

import 'package:strooper/constants/game_colors.dart';
import 'package:strooper/model/question.dart';
import 'package:strooper/helpers/random_index.dart';

const int countdownStaringValue = 30;

class PlayService {
  Question _question = Question();
  int newScore = 0;

  Timer _timer;
  int startTimerAt = countdownStaringValue;

  /// [updateTimerWidget] will be set by view-model which is responsible to
  /// update timer value on UI widget. This should contain setState of the widget
  Function updateTimerWidget = () {};

  Question get question => _nextQuestion();

  Question _nextQuestion() {
    int colorNameIndex = Random().randomIndex();
    int colorValueIndex;

    _question.answer = Random().nextBool();

    if (_question.answer) {
      colorValueIndex = colorNameIndex;
    } else {
      colorValueIndex = Random().randomIndex(exclude: colorNameIndex);
    }

    _question.colorName = colorNames[colorNameIndex];
    _question.colorValue = colors[colorValueIndex];

    return _question;
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (startTimerAt < 1) {
          gameOver();
        } else {
          startTimerAt = startTimerAt - 1;
          updateTimerWidget();
        }
      },
    );
  }

  void restartTimer() {
    stopTimer();
    updateTimerWidget();
    startTimer();
  }

  void gameOver() {
    print('[8]-------- GAME OVER : $newScore--------');
    stopTimer();
    newScore = 0;
    // TODO: Redirect to result screen
    // TODO: Check if newScore with highScore
    // TODO: Call _saveScore method
  }

  /// [quitGame] will be called if game is closed abruptly. In this situation
  /// check for high score and [saveScore] method won't be called.
  void quitGame() {
    print('[9]-------- QuitGame Called --------');
    stopTimer();
    newScore = 0;
  }

  void stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    startTimerAt = countdownStaringValue;
  }
}
