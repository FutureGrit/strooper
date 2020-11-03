import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;

class HomeViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

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
  void showInstruction() {
    print('Instruction button tapped: HomeViewModel');
  }

  // TODO: Create method for navigating to PLAY screen on "Start" button tapped
  void startGame() {
    _navigationService.navigateTo(routes.PlayRoute);
  }
}
