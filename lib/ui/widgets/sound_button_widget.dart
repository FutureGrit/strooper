import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoundButtonWidget extends StatelessWidget {
  const SoundButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool soundEnabled = true;
    return GestureDetector(
      onTap: () {
        // TODO: set isSoundEnabled = !isSoundEnabled
        // TODO: Update sound icon
        print('Sound-on button taped.');
      },
      child: SvgPicture.asset(
        soundEnabled ? 'images/sound-on.svg' : 'images/sound-off.svg',
      ),
    );
  }
}
