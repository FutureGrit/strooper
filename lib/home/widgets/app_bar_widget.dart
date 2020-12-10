import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/helpers/custom_page_route.dart';
import 'package:strooper/helpers/ui_helper.dart';
import 'package:strooper/home/home_view_model.dart';

import 'package:strooper/home/widgets/high_score_widget.dart';
import 'package:strooper/home/widgets/sound_button_widget.dart';
import 'package:strooper/services/sounds/sound_methods.dart';
import 'package:strooper/views/instruction/instruction_view.dart';

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

            horizontalSpacingMedium,

            // Instruction button widget
            GestureDetector(
              onTap: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .showInstruction();
              },
              child: SvgPicture.asset(
                'images/info.svg',
                width: getWidth(context, divideBy: 6.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
