import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:strooper/enums/game_images.dart';
import 'package:strooper/locator.dart';

import 'package:strooper/services/local_db/game_database_service.dart';

class Methods {
  static final GameDatabaseService _gameDatabaseService =
      locator<GameDatabaseService>();

  static double getWidth(BuildContext context, {double divideBy = 1}) =>
      MediaQuery.of(context).size.width / divideBy;

  static double getHeight(BuildContext context, {double divideBy = 1}) =>
      MediaQuery.of(context).size.height / divideBy;

  static Uint8List getImageData({@required GameImages imageType}) =>
      _gameDatabaseService.getImageData(imageType);
}
