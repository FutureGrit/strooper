import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:strooper/constants/sounds.dart';

import 'package:strooper/enums/strooper_actions.dart';

class SoundService {
  SoundService() {
    _backgroundAudioController = AudioPlayer();
    _backgroundAudioCache = AudioCache(fixedPlayer: _backgroundAudioController);

    _buttonAudioController = AudioPlayer();
    _buttonAudioCache = AudioCache(fixedPlayer: _buttonAudioController);

    // Pre-loading audio so that they will always play smoothly.
    _backgroundAudioCache.load(backgroundSound);
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
    StrooperActions.START_GAME: startGameSound,
    StrooperActions.MENU_BUTTON: menuButtonSound,
    StrooperActions.ANSWER_BUTTON: answerButtonSound,
  };

  void playBackgroundMusic() async {
    await _backgroundAudioCache.loop(backgroundSound, volume: .7);
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
