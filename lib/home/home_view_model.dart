import 'dart:developer';

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  // TODO: Create method to provide high score from local DB service

  // Done: Create method to play and stop music
  bool _soundEnabled = true;

  bool get soundStatus => _soundEnabled;

  void updateSoundStatus() {
    // TODO: Update sound status in local DB
    _soundEnabled = !_soundEnabled;
    log('Updated sound status: $_soundEnabled');
    notifyListeners();
  }

  // TODO: Create method for navigating to Instruction screen on "i" button tapped
  void showInstruction() {}

  // TODO: Create method for navigating to PLAY screen on "Start" button tapped
  void startGame() {}
}
