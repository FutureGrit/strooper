import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/home/home_view_model.dart';
import 'package:strooper/home/widgets/sound_button_widget.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingLarge, horizontal: paddingNormal),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'High Score',
                  style: highScoreTextStyle,
                ),
                Text(
                  // TODO: Get high score from local DB
                  '128',
                  style: highScoreTextStyle.copyWith(fontSize: 30),
                ),
              ],
            ),
            Spacer(),
            SoundButtonWidget(),
            verticalSpacingMedium,
            // TODO: on tap open an information dialog
            GestureDetector(
              onTap: () {
                // TODO: open a dialog box with "how to play" instruction
                Provider.of<HomeViewModel>(context, listen: false)
                    .showInstruction();
              },
              child: SvgPicture.asset(
                'images/info.svg',
                width: MediaQuery.of(context).size.width / 6.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
