import 'package:strooper/enums/game_images.dart';

class LoadImages {
  static const Map<GameImages, String> images = {
    /// If any entry is removed then reinstall to remove all stored images data
    /// in the memory and start the app again to load only images in the map entry.

    GameImages.CLOUDS: 'assets/clouds.riv',
    GameImages.START_BUTTON: 'images/start_button.svg',
    GameImages.APP_TITLE: 'images/app_title.svg',
    GameImages.SOUND_OFF: 'images/sound-off.svg',
    GameImages.SOUND_ON: 'images/sound-on.svg',
    GameImages.INSTRUCTION: 'images/info.svg',

    GameImages.ANSWER_RIGHT: 'images/answer_right.svg',
    GameImages.ANSWER_WRONG: 'images/answer_wrong.svg',

    GameImages.GAME_OVER: 'images/game_over.svg',
    GameImages.RESTART_GAME: 'images/restart_button.svg',
    GameImages.GOTO_HOME: 'images/home_button.svg',

    GameImages.BACK: 'images/back_button.svg',
  };
}
