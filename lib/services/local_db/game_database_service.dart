import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:rive/rive.dart';
import 'package:strooper/model/animated_widget_box.dart';

import 'package:strooper/services/local_db/db_keys.dart' as keys;

class GameDatabaseService {
  Box _box;

  Future init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    //..registerAdapter(AnimatedWidgetBoxAdapter());

    // Hive.registerAdapter(AnimatedWidgetBoxAdapter());

    // Open box or local database
    //_box = await Hive.openBox(keys.hiveBox);
    _box = await _openDatabase(); //Hive.openBox(keys.hiveBox);

    _soundStatus = _box.get(keys.soundStatus, defaultValue: false);
    _highScore = _box.get(keys.highScore, defaultValue: 0);

    await _loadAnimatedAssets();
  }

  bool _soundStatus;
  bool get soundStatus => _soundStatus;

  int _highScore;
  int get highScore => _highScore;

  Artboard _artboard;
  Artboard get animationArtboard => _artboard;

  Future saveSoundStatus(bool status) async {
    var _box = await _openDatabase();

    await _box.put(keys.soundStatus, status);

    _closeDatabase();
  }

  Future saveHighScore(int score) async {
    var _box = await _openDatabase();

    _highScore = score;
    await _box.put(keys.highScore, score);

    _closeDatabase();
  }

  Future _openDatabase() {
    return Hive.openBox(keys.hiveBox);
  }

  void _closeDatabase() {
    Hive.close();
  }

  Future _loadAnimatedAssets() async {
    print('[X0]---------- Load Animated Assets ---------');
    var _box = await _openDatabase();

    Uint8List imageResponseData = _box.get('cloudArtboard', defaultValue: null);
    ByteData imageBytes = imageResponseData.buffer.asByteData();
    if (imageBytes == null) {
      print('[X0X]---------- Loading Artboard Animated Assets ---------');
      imageBytes = await rootBundle.load('assets/clouds.riv');
      _box.put('cloudArtboard', imageBytes.buffer.asUint8List());
    } else {}
    final file = RiveFile();

    Artboard _artboard;
    if (file.import(imageBytes)) {
      // Select an animation by its name
      _artboard = file.mainArtboard
        ..addController(SimpleAnimation('floating'))
        ..addController(SimpleAnimation('twinkling'));
    }
    this._artboard = _artboard;

    _closeDatabase();
  }
}
