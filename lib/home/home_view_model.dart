import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/services/sound_service.dart';

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
    _soundEnabled ? _player.backgroundMusic() : _player.stopBackgroundPlayer();
    notifyListeners();
  }

  // TODO: Create method for navigating to Instruction screen on "i" button tapped
  void showInstruction() {
    print('Instruction button tapped: HomeViewModel XX');
    if (_soundEnabled) _player.menuButtonSound();
  }

  // TODO: Create method for navigating to PLAY screen on "Start" button tapped
  void startGame() {
    if (_soundEnabled) _player.startButtonSound();
    _navigationService.navigateTo(routes.PlayRoute);
  }
}
