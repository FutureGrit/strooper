import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:strooper/services/local_db/db_keys.dart' as DbKey;

import 'package:strooper/enums/game_images.dart';
import 'package:strooper/utils/load_images.dart';

class GameDatabaseService {
  Box _gameSettingsBox;
  Box _gameImagesBox;

  bool _soundStatus;
  bool get soundStatus => _soundStatus;

  int _highScore;
  int get highScore => _highScore;

  Future init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    /// [_loadSettingsData] will fetch and set previously stored [score] and
    /// [sound enable status] to be ready to use by the UI
    await _loadSettingsData();

    /// [_loadImagesData] will load all images in the memory as [Uint8List]
    /// ready to access.
    await _loadImagesData();
  }

  Future<void> _loadSettingsData() async {
    _gameSettingsBox = await Hive.openBox(DbKey.gameSettingsBox);

    _soundStatus = _gameSettingsBox.get(DbKey.soundStatus, defaultValue: false);
    _highScore = _gameSettingsBox.get(DbKey.highScore, defaultValue: 0);

    _gameSettingsBox.close();
  }

  Future<void> _loadImagesData() async {
    _gameImagesBox = await Hive.openBox(DbKey.gameImagesBox);

    /// If statement will be executed on first time app runs or if app is crashed on
    /// first run without storing all of the images data to the [gameImagesBox].
    if (_gameImagesBox.isEmpty ||
        (LoadImages.images.length != _gameImagesBox.length)) {
      for (var imageType in LoadImages.images.entries) {
        /// If condition will be true only for the situation when all of the
        /// images are not loaded at first time of app run due to unexpected
        /// reasons, so skip all loaded images and load only missing images into
        /// the [gameImagesBox].
        if (_gameImagesBox.containsKey(imageType.key.index)) {
          continue;
        }

        ByteData imageBytes = await rootBundle.load(imageType.value);
        await _gameImagesBox.put(
            imageType.key.index, imageBytes.buffer.asUint8List());
      }
    }
  }

  Future saveSoundStatus(bool status) async {
    _gameSettingsBox = await Hive.openBox(DbKey.gameSettingsBox);

    await _gameSettingsBox.put(DbKey.soundStatus, status);

    _gameSettingsBox.close();
  }

  Future saveHighScore(int score) async {
    _gameSettingsBox = await Hive.openBox(DbKey.gameSettingsBox);

    _highScore = score;
    await _gameSettingsBox.put(DbKey.highScore, score);

    _gameSettingsBox.close();
  }

  Uint8List getImageData(GameImages imageType) =>
      _gameImagesBox.get(imageType.index, defaultValue: "Image Data Not Found");
}
