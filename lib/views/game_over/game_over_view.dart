import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/popup_background_painter.dart';
import 'package:strooper/model/game_over.dart';

class GameOverView extends StatelessWidget {
  GameOverView({this.scoreDetails});

  final GameOver scoreDetails;
  @override
  Widget build(BuildContext context) {
    debugPrint('[10]-------- GameOverView Rebuilding --------');
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: paddingMedium, horizontal: paddingLarge),
          decoration: appBackgroundDecoration,
          child: Center(
              child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.1,
            child: CustomPaint(
              size: Size(double.infinity, 400),
              painter: PopupBackgroundPainter(),
            ),
          ))),
    );
  }
}
