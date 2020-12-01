import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/game_database_service.dart';

class GameOverViewModel {
  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  bool checkScore(int score) {
    if (score >= _gameDatabaseService.highScore) {
      _gameDatabaseService.saveHighScore(score);
      return true;
    }
    return false;
  }

  int get highScore => _gameDatabaseService.highScore;
}
