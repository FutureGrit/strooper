import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:strooper/services/local_db/db_keys.dart' as keys;

class GameDatabaseService {
  Box _box;

  Future init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    // Open box or local database
    _box = await Hive.openBox(keys.hiveBox);

    _soundStatus = _box.get(keys.soundStatus, defaultValue: false);
    _highScore = _box.get(keys.highScore, defaultValue: 0);
  }

  bool _soundStatus;
  bool get soundStatus => _soundStatus;

  int _highScore;
  int get highScore => _highScore;

  Future getHighScore() async {
    var _box = await _openDatabase();

    _highScore = await _box.get(keys.soundStatus, defaultValue: false);

    _closeDatabase();
  }

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
}
