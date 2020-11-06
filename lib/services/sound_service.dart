import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:strooper/enums/strooper_actions.dart';

class SoundService {
  SoundService() {
    _backgroundAudioController = AudioPlayer();
    _backgroundAudioCache = AudioCache(fixedPlayer: _backgroundAudioController);

    _buttonAudioController = AudioPlayer();
    _buttonAudioCache = AudioCache(fixedPlayer: _buttonAudioController);

    // Pre-loading audio so that they will always play smoothly.
    _backgroundAudioCache.load('background_sound.mp3');
    List<String> audioList = [];
    buttonActionMapping.entries
        .forEach((element) => audioList.add(element.value));
    _buttonAudioCache.loadAll(audioList);
  }

  AudioPlayer _backgroundAudioController;
  AudioCache _backgroundAudioCache;

  AudioPlayer _buttonAudioController;
  AudioCache _buttonAudioCache;

  Map<StrooperActions, String> buttonActionMapping = {
    StrooperActions.START_GAME: "start_button_sound.wav",
    StrooperActions.INSTRUCTION_SHOW: "menu_button_sound.wav",
    StrooperActions.ANSWER_BUTTON: "answer_button_sound.wav",
  };

  void playBackgroundMusic() async {
    await _backgroundAudioCache.loop("background_sound.mp3", volume: .5);
  }

  void stopAllSounds() {
    _backgroundAudioController
      ..stop()
      ..release();

    // Button audio controller only need to release because it has shorter audio
    // which will automatically stop.
    _buttonAudioController?.release();
  }

  void pauseBackgroundMusic() async {
    await _backgroundAudioController.pause();
  }

  void resumeBackgroundMusic() async {
    await _backgroundAudioController.resume();
  }

  void playButtonSound(StrooperActions action) async {
    await _buttonAudioCache.play(buttonActionMapping[action], duckAudio: true);
  }
}
