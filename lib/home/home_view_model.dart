import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/high_score_service.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;

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
    //Todo: Replace route string with const
    _navigationService.navigateTo(routes.PlayRoute);
    print(
        '******************************** OPEN PLAY SCREEN ******************');
  }

  void showInstruction() {
    _navigationService.navigateTo(routes.InstructionRoute);
    print(
        '******************************** OPEN Instruction SCREEN ******************');
  }

  void goBack() {
    _navigationService.goBack();
  }
}
