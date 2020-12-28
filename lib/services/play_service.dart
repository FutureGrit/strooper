import 'dart:async';
import 'dart:math';

import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/constants/values.dart';
import 'package:strooper/utils/game_play_colors.dart';
import 'package:strooper/helpers/random_index.dart';
import 'package:strooper/model/question.dart';

import 'package:strooper/services/high_score_service.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/locator.dart';

class PlayService {
  NavigationService _navigationService = locator<NavigationService>();
  HighScoreService _highScoreService = locator<HighScoreService>();

  Question _question = Question();
  int newScore = 0;

  Timer _timer;
  int startTimerAt = countdownStaringValue;

  /// [updateTimerWidget] will be set by view-model which is responsible to
  /// update timer value on UI widget. This should contain setState of the widget
  Function updateTimerWidget = () {};

  Question get question => _nextQuestion();

  int _range = GamePlayColor.colors.length - 1;
  Question _nextQuestion() {
    int colorNameIndex = Random().nextInt(_range);
    int colorValueIndex;

    _question.answer = Random().nextBool();

    if (_question.answer) {
      /// if answer is true then word and it's color must be the same
      colorValueIndex = colorNameIndex;
    } else {
      /// Get different color for the word
      colorValueIndex =
          Random().randomIndex(range: _range, exclude: colorNameIndex);
    }

    _question.colorName = GamePlayColor.colorNames[colorNameIndex];
    _question.colorValue = GamePlayColor.colors[colorValueIndex];

    return _question;
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(milliseconds: countdownSpeed),
      (Timer timer) {
        print('[T]-------- Timer: $startTimerAt --------');
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

  void gameOver() async {
    print('[8]-------- GAME OVER : $newScore--------');
    stopTimer();
    _navigationService.navigateToRemoveUntil(
      navigateTo: routes.GameOverRoute,
      removeUntil: routes.HomeRoute,
      argument: await _highScoreService.checkScore(newScore),
    );
    newScore = 0;
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
