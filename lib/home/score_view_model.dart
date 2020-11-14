import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/sound_service.dart';

class ScoreViewModel extends ChangeNotifier {
  ScoreViewModel() {
    highScore = _gameDatabaseService.highScore;
  }

  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();
  //final SoundService _player = locator<SoundService>();

  int highScore;
  //int get highScore => _highScore;

  int updatedHighScore() {
    //highScore = _gameDatabaseService.highScore;
    return highScore;
    //return highScore;
  }

  bool checkScore({@required int newScore}) {
    if (newScore > highScore) {
      print('******** New High Score: $newScore ----------ScoreViewModel');
      highScore = newScore;
      // TODO: set isHighScore = true to render correct gameOverMenu;

      //DatabaseMethods.saveHighScore(newScore);
      _gameDatabaseService.saveHighScore(newScore);

      updatedHighScore();
      notifyListeners();
      return true;
    }

    print('--------------Low Score: $newScore Try Again ----------:(VM ');
    return false;
  }
}
