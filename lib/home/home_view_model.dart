import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/services/sound_service.dart';
import 'package:strooper/enums/strooper_actions.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    // initialize default values
    _soundEnabled = _gameDatabaseService.soundStatus;
    _highScore = _gameDatabaseService.highScore;
    _soundPaused = false;
  }

  bool _soundEnabled;
  bool _soundPaused;
  int _highScore;

  // bool isBusy = false;

  // Future initialise() async {
  //   _setBusy(true);
  //   await _gameDatabaseService.init();
  //   _soundEnabled = _gameDatabaseService.soundStatus;
  //   _highScore = _gameDatabaseService.highScore;
  //   _setBusy(false);
  //   print(
  //       '--------------- Called: HomeViewModel: SoundStatus: $_soundEnabled || $_highScore --------------');
  // }

  // void _setBusy(bool status) {
  //   isBusy = status;
  //   notifyListeners();
  // }

  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SoundService _player = locator<SoundService>();

  // TODO: Create method to provide high score from local DB service

  bool get soundStatus => _soundEnabled;
  int get highScore => _highScore;

  void updateSoundStatus() {
    // TODO: Update sound status in local DB
    _soundEnabled = !_soundEnabled;
    notifyListeners();
    _soundEnabled
        ? _player.playBackgroundMusic()
        // this will stop background music and button sounds
        : _player.stopAllSounds();
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

  /// This method will be called on game over to check the new score is higher
  /// then the previous highScore, if yes then highScore will be updated with
  /// newScore and will be saved to the database.
  ///
  /// It has return type bool to render ui based on the below condition:
  /// if return true: Show UI with title "New Highest Score"
  /// if return false: Show UI with title "Sorry Your score is low, Try Again" etc..
  bool saveScore(int newScore) {
    if (newScore > _highScore) {
      _gameDatabaseService.saveHighScore(newScore);
      _highScore = newScore;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// This method will be called on app dispose method to save status of sound
  /// button in database before app close.
  /// SOUND_ON = true and SOUND_OFF = false
  void saveSoundStatus(bool status) {
    _gameDatabaseService.saveSoundStatus(status);
  }
  //
  // void loadAssetsInMemory() {
  //   precachePicture(provider, null);
  // }
}
