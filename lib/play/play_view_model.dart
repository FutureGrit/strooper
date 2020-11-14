import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strooper/locator.dart';

import 'package:strooper/services/local_db/database_setup.dart';
import 'package:strooper/services/local_db/game_database_service.dart';

class PlayViewModel extends ChangeNotifier {
  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  int get highScore => _gameDatabaseService.highScore;

  void restartGame() {
    // TODO: Play button sound
    // TODO: Restart game from beginning
  }

  void goToHome() {
    // TODO: Go back to home screen
  }

  /// This method will be called on game over to check the new score is higher
  /// then the previous highScore, if yes then highScore will be updated with
  /// newScore and will be saved to the database.
  ///
  /// It has return type bool to render ui based on the below condition:
  /// if return true: Show UI with title "New Highest Score"
  /// if return false: Show UI with title "Sorry Your score is low, Try Again" etc..
  bool _saveScore({@required int newScore}) {
    if (newScore > highScore) {
      print('******** New High Score: $newScore ----------XX');
      //_highScore = newScore;
      // TODO: set isHighScore = true to render correct gameOverMenu;

      //DatabaseMethods.saveHighScore(newScore);
      _gameDatabaseService.saveHighScore(newScore);

      notifyListeners();
      return true;
    }

    print('--------------Low Score: $newScore Try Again ----------:( ');
    return false;
  }

  nextQuestion() {
    // TODO: Provide random Color Name with color
    // TODO: return a model "question: Color, Text, isValid"
  }

  checkAnswer(int tempScore) {
    bool result = _saveScore(newScore: tempScore);
    // set isAnswerSubmitted = true
    // TODO: check if answer(true or false) is equal to isValid
    // TODO: if yes then call
    // increaseCurrentScore(NL), nextQuestion(NL) , resetCountdown(NL) or restartCountdown
    // TODO: if answer is wrong then call
    //  gameOver(NL) method which will be responsible to
    //  return
  }

  // This method will be called after checking answer or if countdown time is over
  gameOver() {
    // call saveScore() method which will return
    // set isGameOVer to true then
  }

  increaseCurrentScore() {
    // TODO: update score by one and notify
  }

  // this method will be future/Stream and will use system time to wait and notify
  // only updated countdownValue to UI
  // countdownDuration can be passed as a parameter to this function and set in const
  startCountdownTimer() {
    // TODO: decrease countdown by one and sent it to view, which will check if
    // if countdownValue >= 0 then wait for one second and decrease countdown
    // by one then notify so UI can be updated
    // else call gameOver() because user was not able to answer within given time.

    // if isAnswerSubmitted is true then get out of the loop and don't call gameOver as it will be called from checkAnswer()
  }

  resetCountdownTimer() {
    // TODO: reset to default value countdownDefaultValue = 3
    // TODO: call startCountdownTimer again
  }

  // This method will be called
  stopCountdownTimer() {
    // TODO:
  }
}
