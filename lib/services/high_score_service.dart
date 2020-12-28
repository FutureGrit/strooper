import 'package:strooper/locator.dart';
import 'package:strooper/model/game_over.dart';
import 'package:strooper/services/local_db/game_database_service.dart';

class HighScoreService {
  /// [updateHighScoreWidget] will be set by view-model which is responsible to
  /// update highest score on UI widget. This should contain setState of that widget
  Function updateHighScoreWidget = () {};

  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  Future checkScore(int score) async {
    if (score >= _gameDatabaseService.highScore) {
      await _gameDatabaseService.saveHighScore(score);

      updateHighScoreWidget();
      return GameOver(highScore: score, isHighest: true);
    }
    return GameOver(newScore: score, highScore: highScore, isHighest: false);
  }

  int get highScore => _gameDatabaseService.highScore;
}
