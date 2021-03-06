import 'package:get_it/get_it.dart';

import 'package:strooper/services/high_score_service.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/play_service.dart';
import 'package:strooper/services/sounds/sound_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GameDatabaseService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SoundService());
  locator.registerLazySingleton(() => PlayService());
  locator.registerLazySingleton(() => HighScoreService());
}
