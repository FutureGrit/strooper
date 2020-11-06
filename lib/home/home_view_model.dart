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

  bool _soundEnabled = false;
  bool _soundPaused = false;

  bool get soundStatus => _soundEnabled;

  void updateSoundStatus() {
    // TODO: Update sound status in local DB
    _soundEnabled = !_soundEnabled;
    _soundEnabled
        ? _player.playBackgroundMusic()
        : _player
            .stopAllSounds(); // this will stop background music and button sounds
    notifyListeners();
  }

  /// Pause game background music if sound is enabled(playing). Music will
  /// resume from the point that it has been paused.
  void pauseBackgroundMusic() {
    if (_soundEnabled) {
      _player.pauseBackgroundMusic();
      _soundPaused = true;
    }
  }

  /// Resume game background music if it's paused and app is no longer in
  /// background and inactive.
  void resumeBackgroundMusic() {
    if (_soundPaused) {
      _player.resumeBackgroundMusic();
      _soundPaused = false;
    }
  }

  // TODO: Create method for navigating to Instruction screen on "i" button tapped
  void showInstruction() {
    log('Instruction button tapped: HomeViewModel');
    if (_soundEnabled)
      _player.playButtonSound(StrooperActions.INSTRUCTION_SHOW);
  }

  void startGame() {
    if (_soundEnabled) _player.playButtonSound(StrooperActions.START_GAME);
    _navigationService.navigateTo(routes.PlayRoute);
  }
}
