import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:strooper/enums/strooper_actions.dart';

class SoundService {
  SoundService() {
    _backgroundAudioController = AudioPlayer();
    _backgroundAudioCache = AudioCache(fixedPlayer: _backgroundAudioController);

    _buttonAudioController = AudioPlayer();
    _buttonAudioCache = AudioCache(fixedPlayer: _buttonAudioController);
  }

  AudioPlayer _backgroundAudioController;
  AudioCache _backgroundAudioCache;

  AudioPlayer _buttonAudioController;
  AudioCache _buttonAudioCache;

  Map<STROOPER_ACTIONS, String> buttonActionMapping = {
    STROOPER_ACTIONS.START_GAME: "start_button_sound.wav",
    STROOPER_ACTIONS.INSTRUCTION_SHOW: "menu_button_sound.wav",
    STROOPER_ACTIONS.ANSWER_BUTTON: "answer_button_sound.wav",
  };

  void playBackgroundMusic() async {
    await _backgroundAudioCache.loop("background_sound.mp3", volume: .5);
  }

  void stopBackgroundMusic() {
    _backgroundAudioController
      ..stop()
      ..release();
  }

  void playButtonSound(STROOPER_ACTIONS action) async {
    _buttonAudioController?.stop();
    await _buttonAudioCache.play(buttonActionMapping[action], duckAudio: true);
  }
}
// TODO: Clear cache when app is closed
// TODO: on device sleep state or app is not active then pause background sound
// TODO: on device active resume background sound
