import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/game_database_service.dart';

class DatabaseMethods {
  static final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  static Future initialise() async {
    await _gameDatabaseService.init();

    await _loadAssets();
  }

  static bool getSoundStatus() => _gameDatabaseService.soundStatus;
  static int getHighScore() => _gameDatabaseService.highScore;

  static saveSoundStatus(bool status) =>
      _gameDatabaseService.saveSoundStatus(status);

  static saveHighScore(int score) => _gameDatabaseService.saveHighScore(score);

  static Future _loadAssets() async {
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, 'images/sound-on.svg'),
        null);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, 'images/sound-off.svg'),
        null);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, 'images/info.svg'),
        null);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, 'images/app_title.svg'),
        null);
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'images/start_button.svg'),
        null);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, 'images/clouds.svg'),
        null);
  } // End of loadAssets method
}
