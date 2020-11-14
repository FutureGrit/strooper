import 'package:get_it/get_it.dart';

import 'package:strooper/home/score_view_model.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/sounds/sound_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GameDatabaseService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SoundService());

  locator.registerLazySingleton(() => ScoreViewModel());
}
