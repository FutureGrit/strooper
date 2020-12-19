import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/enums/strooper_actions.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/high_score_service.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/services/sounds/sound_methods.dart';

class HomeViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final HighScoreService _highScoreService = locator<HighScoreService>();

  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  HomeViewModel() {
    _highScoreService.updateHighScoreWidget = () {
      notifyListeners();
    };
  }

  int get highScore => _highScoreService.highScore;

  void startGame() {
    SoundMethods.playButtonSound(action: StrooperActions.START_GAME);
    _navigationService.navigateTo(routes.PlayRoute);
    print('*********** OPEN PLAY SCREEN **********');
  }

  void showInstruction() {
    SoundMethods.playButtonSound(action: StrooperActions.MENU_BUTTON);
    _navigationService.navigateTo(routes.InstructionRoute);
    print('********** OPEN Instruction SCREEN **********');
  }

  Artboard getArtboard() {
    print(
        '[00]----------------- Animated Artboard  ${_gameDatabaseService.animationArtboard}-------------------');
    return _gameDatabaseService.animationArtboard;
  }
}
