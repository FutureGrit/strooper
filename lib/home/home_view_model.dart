import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/services/high_score_service.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/services/sounds/sound_methods.dart';

class HomeViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final HighScoreService _highScoreService = locator<HighScoreService>();

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
}
