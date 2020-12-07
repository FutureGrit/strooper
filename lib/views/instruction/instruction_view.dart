import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';

class InstructionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: paddingLarge),
        alignment: AlignmentDirectional.center,
        decoration: appBackgroundDecoration,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10.5,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: Color(0x38ffffff),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(100.0),
                      ),
                    ),
                    child: Text(
                      "How to play?",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
                horizontalSpacingMedium,
                SvgPicture.asset("images/back_button.svg"),
                horizontalSpacingSmall,
              ],
            ),
            verticalSpacingMedium,
          ],
        ),
      ),
    );
  }
}
