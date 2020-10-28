import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoundButtonWidget extends StatefulWidget {
  @override
  _SoundButtonWidgetState createState() => _SoundButtonWidgetState();
}

class _SoundButtonWidgetState extends State<SoundButtonWidget> {
  // TODO: Move soundEnabled variable to service "strooper_preference.dart"
  bool soundEnabled = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        // TODO: Create method for repeated code for sound button
        child: soundEnabled
            ? soundButton(key: 'sound-on', imagePath: 'images/sound-on.svg')
            : soundButton(key: 'sound-off', imagePath: 'images/sound-off.svg'));
  }

  Widget soundButton({@required String key, @required String imagePath}) =>
      Container(
        key: Key(key),
        child: GestureDetector(
          onTap: () {
            setState(() {
              // TODO: Get soundEnabled from [HomeViewModel]
              soundEnabled = !soundEnabled;
            });
          },
          child: SvgPicture.asset(
            imagePath,
            width: MediaQuery.of(context).size.width / 6.5,
          ),
        ),
      );
}
