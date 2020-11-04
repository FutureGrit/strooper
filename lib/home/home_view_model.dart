import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/services/sound_service.dart';
import 'package:strooper/enums/strooper_actions.dart';

class HomeViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();
  final SoundService _player = locator<SoundService>();

  // TODO: Create method to provide high score from local DB service

  // Done: Create method to play and stop music
  bool _soundEnabled = false;

  bool get soundStatus => _soundEnabled;

  void updateSoundStatus() {
    // TODO: Update sound status in local DB
    _soundEnabled = !_soundEnabled;
    log('Updated sound status: $_soundEnabled');
    _soundEnabled
        ? _player.playBackgroundMusic(STROOPER_ACTIONS.SOUND_ON)
        : _player.stopBackgroundMusic();
    notifyListeners();
  }

  // TODO: Create method for navigating to Instruction screen on "i" button tapped
  void showInstruction() {
    print(
        'Instruction button tapped: HomeViewModel: Improved Sound Structue ********');
    if (_soundEnabled)
      _player.playButtonSound(STROOPER_ACTIONS.INSTRUCTION_SHOW);
  }

  // TODO: Create method for navigating to PLAY screen on "Start" button tapped
  void startGame() {
    if (_soundEnabled) _player.playButtonSound(STROOPER_ACTIONS.START_GAME);
    _navigationService.navigateTo(routes.PlayRoute);
  }
}
