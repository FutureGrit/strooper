import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:strooper/enums/strooper_actions.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/database_methods.dart';
import 'package:strooper/services/local_db/game_database_service.dart';
import 'package:strooper/services/sound_service.dart';

class SoundMethods {
  static final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();
  static final SoundService _player = locator<SoundService>();

  static bool _soundEnabled = DatabaseMethods.getSoundStatus();
  static bool _soundPaused = false;

  static bool get soundStatus => _soundEnabled;

  static void updateSoundStatus() {
    _soundEnabled = !_soundEnabled;
    _soundEnabled
        ? _player.playBackgroundMusic()
        // this will stop background music and button sounds
        : _player.stopAllSounds();

    /// Save sound status in local database
    _gameDatabaseService.saveSoundStatus(_soundEnabled);
  }

  /// Pause game background music if sound is enabled(playing). Music will
  /// resume from the point that it has been paused.
  static void pauseBackgroundMusic() {
    if (_soundEnabled) {
      _player.pauseBackgroundMusic();
      _soundPaused = true;
    }
  }

  /// Resume game background music if it's paused and app is no longer in
  /// background and inactive.
  static void resumeBackgroundMusic() {
    if (_soundPaused) {
      _player.resumeBackgroundMusic();
      _soundPaused = false;
    }
  }

  static void playBackgroundMusic() {
    if (_soundEnabled) {
      _player.playBackgroundMusic();
    }
  }

  static void playButtonSound({@required StrooperActions action}) {
    if (_soundEnabled) _player.playButtonSound(action);
  }
}
