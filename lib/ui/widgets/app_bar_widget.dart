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
                  '128',
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                      color: Colors.white,
                      fontSize: 28),
                ),
              ],
            ),
            Spacer(),
            SoundButtonWidget(),
            SizedBox(
              width: 18,
            ),
            // TODO: on tap open an information dialog
            SvgPicture.asset('images/info.svg'),
          ],
        ),
      ),
    );
  }
}
