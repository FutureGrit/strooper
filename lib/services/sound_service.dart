import 'package:audioplayers/audio_cache.dart';

// TODO: create media control like: soundOnControl, SoundOffControl,
class SoundService {
  final player = AudioCache();

  void backgroundMusic() async {
    // TODO: Set continuous loop for background music
    // TODO: checkout low latency option for background music
    await player.play('background_sound.mp3');
  }

  void startButtonSound() {
    // TODO: Play sound
  }

  void answerButtonSound() {
    // TODO: Play sound
  }

  void menuButtonSound() {
    // TODO: Play sound
  }
}
