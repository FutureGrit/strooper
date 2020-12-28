import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/services/sounds/sound_methods.dart';

class GameOverViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  void restartGame() {
    SoundMethods.playButtonSound(action: StrooperActions.START_GAME);
    _navigationService.navigateToRemoveUntil(
        navigateTo: routes.PlayRoute, removeUntil: routes.HomeRoute);
  }

  void goBack() {
    SoundMethods.playButtonSound(action: StrooperActions.MENU_BUTTON);
    _navigationService.goBack();
  }
}
