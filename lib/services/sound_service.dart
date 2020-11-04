import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:strooper/enums/strooper_actions.dart';

class SoundService {
  SoundService() {
    _backgroundAudioController = AudioPlayer();
    _backgroundAudioCache = AudioCache(fixedPlayer: _backgroundAudioController);

    _buttonAudioCache = AudioCache();
  }

  AudioPlayer _backgroundAudioController = AudioPlayer();
  AudioCache _backgroundAudioCache;

  AudioCache _buttonAudioCache;

  Map<STROOPER_ACTIONS, String> actionMapping = {
    STROOPER_ACTIONS.SOUND_ON: "background_sound.mp3",
    STROOPER_ACTIONS.START_GAME: "start_button_sound.wav",
    STROOPER_ACTIONS.INSTRUCTION_SHOW: "menu_button_sound.wav",
    STROOPER_ACTIONS.ANSWER_BUTTON: "answer_button_sound.wav",
  };

  // TODO: Load sounds before using them.

  void playBackgroundMusic(STROOPER_ACTIONS action) async {
    await _backgroundAudioCache.loop(actionMapping[action], volume: .5);
  }

  void stopBackgroundMusic() {
    _backgroundAudioController.stop();
    _backgroundAudioController.release();
  }

  void playButtonSound(STROOPER_ACTIONS action) async {
    await _buttonAudioCache.play(actionMapping[action]);
  }
}
