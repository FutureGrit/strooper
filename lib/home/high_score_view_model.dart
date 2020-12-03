import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/high_score_service.dart';

class HighScoreViewModel extends ChangeNotifier {
  final HighScoreService _highScoreService = locator<HighScoreService>();

  HighScoreViewModel() {
    _highScoreService.updateHighScoreWidget = () {
      notifyListeners();
    };
  }

  int get highScore => _highScoreService.highScore;
}
