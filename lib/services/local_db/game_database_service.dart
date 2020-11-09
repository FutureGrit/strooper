import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:strooper/services/local_db/db_keys.dart' as keys;

class GameDatabaseService {
  Box _box;
  bool _soundStatus;
  int _highScore;

  Future init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    // Open box or local database
    _box = await Hive.openBox(keys.hiveBox);

    _soundStatus = _box.get(keys.soundStatus, defaultValue: false);
    _highScore = _box.get(keys.highScore, defaultValue: 0);
  }

  bool get soundStatus => _soundStatus;
  int get highScore => _highScore;

  void saveSoundStatus(bool status) async{
    var _box = await _openDatabase();

    _box.put(keys.soundStatus, status);
    log('Update soundStatus: $status');

    _closeDatabase();
  }

  void saveHighScore(int score) async {
    var _box = await _openDatabase();

    _box.put(keys.highScore, score);
    log('Updated highScore: $score');

    _closeDatabase();
  }

  Future _openDatabase() => Hive.openBox(keys.hiveBox);
  void _closeDatabase() => Hive.close();
}
