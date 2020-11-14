import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/game_database_service.dart';

class ScoreViewModel extends ChangeNotifier {
  ScoreViewModel() {
    _highScore = _gameDatabaseService.highScore;
  }

  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  int _highScore;
  int get highScore => _highScore;

  bool checkScore({@required int newScore}) {
    if (newScore > _highScore) {
      _highScore = newScore;
      // TODO: set isHighScore = true to render correct gameOverMenu;

      _gameDatabaseService.saveHighScore(newScore);

      notifyListeners();
      return true;
    }
    return false;
  }
}
