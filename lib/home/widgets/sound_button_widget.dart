import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/home/home_view_model.dart';

class SoundButtonWidget extends StatefulWidget {
  @override
  _SoundButtonWidgetState createState() => _SoundButtonWidgetState();
}

class _SoundButtonWidgetState extends State<SoundButtonWidget> {
  HomeViewModel homeViewModel;

  // TODO: Move soundEnabled variable to service "strooper_preference.dart"
  //bool soundEnabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        // TODO: Create method for repeated code for sound button
        child: homeViewModel.soundStatus
            ? soundButton(key: 'sound-on', imagePath: 'images/sound-on.svg')
            : soundButton(key: 'sound-off', imagePath: 'images/sound-off.svg'));
  }

  Widget soundButton({@required String key, @required String imagePath}) =>
      Container(
        key: Key(key),
        child: GestureDetector(
          onTap: () {
            homeViewModel.updateSoundStatus();
          },
          child: SvgPicture.asset(
            imagePath,
            width: MediaQuery.of(context).size.width / 6.5,
          ),
        ),
      );
}
