import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoundButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Move soundEnabled variable to service "strooper_preference.dart"
    bool soundEnabled = true;
    return GestureDetector(
      onTap: () {
        // TODO: Access soundEnabled variable from "home_view_model.dart"
        // TODO: set soundEnabled = !soundEnabled
        // TODO: Update sound icon
        print('Sound-on button taped.');
      },
      child: SvgPicture.asset(
        soundEnabled ? 'images/sound-on.svg' : 'images/sound-off.svg',
      ),
    );
  }
}
