// import 'dart:async';

class TimerService {
  // TODO: current timer should start at same const in model
  //int currentTimerValue = 0;
  bool restart = false;
  bool isGameOver = false;

  int newScore = 0;

  // TODO: set new score and create game over function and pass that in it.

  void shouldRestartTimer(bool value) {
    restart = value;
  }

  int updateNewScore() {
    return newScore++;
  }

  void gameOver() {
    print('************ TS: GameOver() new score: $newScore ****************');
    isGameOver = true;
    newScore = 0;
    // TODO: redirect to another screen and pass new score
    // TODO: check if it high score or not
    // TODO: call saveScore() method which will return
  }
}

/// This method will be called on game over to check the new score is higher
/// then the previous highScore, if yes then highScore will be updated with
/// newScore and will be saved to the database.
///
/// It has return type bool to render ui based on the below condition:
/// if return true: Show UI with title "New Highest Score"
/// if return false: Show UI with title "Sorry Your score is low, Try Again" etc..
// bool _saveScore({@required int newScore}) {
//   if (newScore > highScore) {
//     print('******** New High Score: $newScore ----------XX');
//     //_highScore = newScore;
//     // TODO: set isHighScore = true to render correct gameOverMenu;
//
//     //DatabaseMethods.saveHighScore(newScore);
//     _gameDatabaseService.saveHighScore(newScore);
//
//     notifyListeners();
//     return true;
//   }
//
//   print('--------------Low Score: $newScore Try Again ----------:( ');
//   return false;
// }
