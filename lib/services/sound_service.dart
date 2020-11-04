import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

// TODO: create media control like: soundOnControl, SoundOffControl,
class SoundService {
  AudioPlayer _controllerPlayer;
  AudioCache _backgroundAudioCache;

  AudioPlayer _buttonAudioController;
  AudioCache _buttonAudioCache;

  SoundService() {
    _controllerPlayer = AudioPlayer();
    _backgroundAudioCache = AudioCache(fixedPlayer: _controllerPlayer);

    _buttonAudioController = AudioPlayer();
    _buttonAudioCache = AudioCache(fixedPlayer: _buttonAudioController);
  }

  void backgroundMusic() async {
    await _backgroundAudioCache.loop('background_sound.mp3');
  }

  void startButtonSound() async {
    _stopButtonPlayer();
    await _buttonAudioCache.play('start_button_sound.wav');
  }

  void answerButtonSound() {
    _stopButtonPlayer();
    _buttonAudioCache.play('answer_button_sound.wav');
  }

  void menuButtonSound() {
    _stopButtonPlayer();
    _buttonAudioCache.play('menu_button_sound.wav');
  }

  void _stopButtonPlayer() {
    _buttonAudioController.stop();
  }

  void stopBackgroundPlayer() {
    _controllerPlayer.stop();
  }
}
