import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:strooper/constants/values.dart';
import 'package:strooper/enums/game_images.dart';
import 'package:strooper/utils/methods.dart';

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
              imageType: GameImages.SOUND_ON,
            )
          : soundButton(
              context: context,
              key: 'sound-off',
              imageType: GameImages.SOUND_OFF,
            ),
    );
  }

  Widget soundButton(
          {@required BuildContext context,
          @required String key,
          @required GameImages imageType}) =>
      Container(
        key: Key(key),
        child: GestureDetector(
          onTap: () {
            setState(() {
              SoundMethods.updateSoundStatus();
            });
          },
          child: SvgPicture.memory(
            Methods.getImageData(imageType: imageType),
            width: Methods.getWidth(context, divideBy: 5.5),
          ),
        ),
      );
}
