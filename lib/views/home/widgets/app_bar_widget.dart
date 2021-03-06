import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/values.dart';
import 'package:strooper/enums/game_images.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/utils/methods.dart';
import 'package:strooper/utils/ui_utils.dart';

import '../home_view_model.dart';
import 'high_score_widget.dart';
import 'sound_button_widget.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingMedium, horizontal: paddingNormal),
        child: Row(
          children: [
            // High Score widget
            HighScoreWidget(),

            Spacer(),

            // Sound on and off widget
            SoundButtonWidget(),

            horizontalSpacingMedium,

            // Instruction button widget
            BounceAnimation(
              duration: instructionButtonAnimationDuration,
              onTap: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .showInstruction();
              },
              bounceWidget: SvgPicture.memory(
                  Methods.getImageData(imageType: GameImages.INSTRUCTION),
                  width: Methods.getWidth(context, divideBy: 5.5)),
            ),
          ],
        ),
      ),
    );
  }
}
