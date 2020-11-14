import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strooper/enums/strooper_actions.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/database_methods.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/sound_service.dart';

class SoundViewModel extends ChangeNotifier {
  final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();
  final SoundService _player = locator<SoundService>();

  bool _soundEnabled = DatabaseMethods.getSoundStatus();
  bool _soundPaused = false;

  bool get soundStatus => _soundEnabled;

  void updateSoundStatus() {
    _soundEnabled = !_soundEnabled;
    _soundEnabled
        ? _player.playBackgroundMusic()
        // this will stop background music and button sounds
        : _player.stopAllSounds();
    notifyListeners();

    /// Save sound status in local database
    _gameDatabaseService.saveSoundStatus(_soundEnabled);
    // DatabaseMethods.saveSoundStatus(_soundEnabled);
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

  void playButtonSound({@required StrooperActions action}) {
    if (_soundEnabled) _player.playButtonSound(action);
  }
}
