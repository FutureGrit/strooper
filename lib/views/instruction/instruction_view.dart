import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';

class InstructionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingLarge, horizontal: paddingMedium),
        alignment: AlignmentDirectional.center,
        decoration: appBackgroundDecoration,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "How to play?",
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
                Spacer(),
                SvgPicture.asset("images/restart_button.svg")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
