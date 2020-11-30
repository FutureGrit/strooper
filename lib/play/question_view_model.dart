import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/model/question.dart';
import 'package:strooper/services/play_service.dart';

class QuestionViewModel extends ChangeNotifier {
  QuestionViewModel() {
    question = _playService.question;
  }

  final PlayService _playService = locator<PlayService>();

  int newScore = 0;
  Question question;

  int get score => _playService.newScore;

  checkAnswer(bool userPickedAnswer) {
    if (question.answer == userPickedAnswer) {
      _playService.newScore += 1;
      question = _playService.question;

      _playService.restartTimer();
      notifyListeners();
    } else {
      _playService.gameOver();
    }
  }
}
