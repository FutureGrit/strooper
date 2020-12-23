import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/game_database_service.dart';

class DatabaseSetup {
  static final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  static Future initialise() async {
    /// Place any code which need to be executed before rendering the
    /// first UI screen.
    await _gameDatabaseService.init();
  }
}
