import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/home/home_view_model.dart';
import 'package:strooper/home/sound_methods.dart';
import 'package:strooper/home/widgets/high_score_widget.dart';
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
            // High Score widget
            HighScoreWidget(),

            Spacer(),

            // Sound on and off widget
            SoundButtonWidget(),

            verticalSpacingMedium,

            // Instruction button widget
            GestureDetector(
              onTap: () {
                SoundMethods.playButtonSound(
                    action: StrooperActions.INSTRUCTION_SHOW);
                print('--- Navigating to Instruction View ----');
                // TODO: open a dialog box with "how to play" instruction
                //Provider.of<HomeViewModel>(context, listen: false).showInstruction();
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
