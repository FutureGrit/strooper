import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/strings.dart';

import '../home_view_model.dart';

class HighScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              highScore,
              style: highScoreTextStyle,
            ),
            Text(
              Provider.of<HomeViewModel>(context, listen: true)
                  .highScore
                  .toString(),
              style: highScoreTextStyle.copyWith(fontSize: 30),
            )
          ],
        );
      },
    );
  }
}
