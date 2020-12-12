import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:strooper/constants/values.dart';
import 'package:strooper/utils/ui_helper.dart';

import 'package:strooper/services/sounds/sound_methods.dart';

class SoundButtonWidget extends StatefulWidget {
  @override
  _SoundButtonWidgetState createState() => _SoundButtonWidgetState();
}

class _SoundButtonWidgetState extends State<SoundButtonWidget>
    with WidgetsBindingObserver {
  // TODO: Move soundEnabled variable to service "strooper_preference.dart"

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SoundMethods.playBackgroundMusic();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused:
        SoundMethods.pauseBackgroundMusic();
        break;
      case AppLifecycleState.inactive:
        SoundMethods.pauseBackgroundMusic();
        break;
      case AppLifecycleState.resumed:
        SoundMethods.resumeBackgroundMusic();
        break;
      case AppLifecycleState.detached:
        SoundMethods.pauseBackgroundMusic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: animatedSwitcherDuration),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      // TODO: Create method for repeated code for sound button
      child: SoundMethods.soundStatus
          ? soundButton(
              context: context,
              key: 'sound-on',
              imagePath: 'images/sound-on.svg')
          : soundButton(
              context: context,
              key: 'sound-off',
              imagePath: 'images/sound-off.svg'),
    );
  }

  Widget soundButton(
          {@required BuildContext context,
          @required String key,
          @required String imagePath}) =>
      Container(
        key: Key(key),
        child: GestureDetector(
          onTap: () {
            setState(() {
              SoundMethods.updateSoundStatus();
            });
          },
          child: SvgPicture.asset(
            imagePath,
            width: getWidth(context, divideBy: 5.5),
          ),
        ),
      );
}