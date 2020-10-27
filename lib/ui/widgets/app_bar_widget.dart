import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:strooper/ui/widgets/sound_button_widget.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'High Score',
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                      color: Colors.white,
                      fontSize: 14),
                ),
                Text(
                  // TODO: Get high score from local DB
                  '128',
                  // TODO: Move text style
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                      color: Colors.white,
                      fontSize: 30),
                ),
              ],
            ),
            Spacer(),
            SoundButtonWidget(),
            SizedBox(width: 20),
            // TODO: on tap open an information dialog
            GestureDetector(
              onTap: () {
                // TODO: open a dialog box with "how to play" instruction
                print('Instruction button tapped');
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
