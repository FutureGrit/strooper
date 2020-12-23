import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/constants/app_colors.dart';
import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/values.dart';
import 'package:strooper/enums/game_images.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/helpers/dotted_border.dart';
import 'package:strooper/utils/methods.dart';
import 'package:strooper/utils/ui_utils.dart';

import 'package:strooper/services/sounds/sound_methods.dart';

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
                    height: Methods.getHeight(context, divideBy: 10.5),
                    alignment: AlignmentDirectional.center,
                    decoration: howToPlayDecoration,
                    child: Text(
                      "How to play?",
                      style: howToPlayTextStyle,
                    ),
                  ),
                ),
                horizontalSpacingMedium,
                BounceAnimation(
                  duration: goBackButtonAnimationDuration,
                  onTap: () {
                    SoundMethods.playButtonSound(
                        action: StrooperActions.MENU_BUTTON);
                    Navigator.pop(context);
                  },
                  bounceWidget: SvgPicture.memory(
                      Methods.getImageData(imageType: GameImages.BACK)),
                ),
                horizontalSpacingNormal,
              ],
            ),
            verticalSpacingMedium,
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      left: paddingNormal,
                      bottom: paddingLarge,
                      right: paddingNormal),
                  child: Column(
                    children: [
                      Text(
                        "You will be presented with a word (name of a color) "
                        "and this word will be displayed using a color.",
                        style: detailTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                      verticalSpacingExtraLarge,
                      exampleWidget(
                        context,
                        word: "RED",
                        color: Colors.green,
                        description: "- Word: Red\n- Color: Green",
                        iconPath: "images/wrong_icon.svg",
                      ),
                      verticalSpacingNormal,
                      Text(
                        "As the word (red) and its color (green) do not match "
                        "then tap on the [wrong] button.",
                        style: detailTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                      verticalSpacingExtraLarge,
                      exampleWidget(
                        context,
                        word: "RED",
                        color: Colors.red,
                        description: "- Word: Red\n- Color: Red",
                        iconPath: "images/right_icon.svg",
                      ),
                      verticalSpacingNormal,
                      Text(
                        "As the word (red) and its color (red) does match then "
                        "tap on the [correct] button.",
                        style: detailTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                      verticalSpacingMedium,
                      Text(
                        "Please make sure to answer the question before the "
                        "countdown timer is over.",
                        style: detailTextStyle,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget exampleWidget(BuildContext context,
      {@required String word,
      @required Color color,
      @required String description,
      @required String iconPath}) {
    return DottedBorder(
      color: dottedBorderColor,
      strokeWidth: 2.0,
      dottedLength: 5,
      space: 10,
      corner: DottedBorderCorner.all(exampleWidgetCornerRadius),
      child: Container(
        width: double.infinity,
        color: exampleWidgetColor,
        height: Methods.getHeight(context, divideBy: 8),
        padding: EdgeInsets.all(paddingSmall),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: FittedBox(
                child: Text(
                  word,
                  style: TextStyle(color: color),
                ),
              ),
            ),
            horizontalSpacingMidSmall,
            Expanded(
              flex: 3,
              child: FittedBox(
                alignment: AlignmentDirectional.center,
                child: Text(
                  description,
                  style: exampleWidgetTextStyle,
                ),
              ),
            ),
            Container(
              height: exampleWidgetButtonSize,
              width: exampleWidgetButtonSize,
              margin: EdgeInsets.fromLTRB(
                  paddingMidSmall, paddingSmall, paddingSmall, paddingSmall),
              padding: EdgeInsets.all(exampleWidgetCornerRadius),
              decoration: exampleWidgetButtonDecoration,
              child: SvgPicture.asset(iconPath),
            )
          ],
        ),
      ),
    );
  }
}
