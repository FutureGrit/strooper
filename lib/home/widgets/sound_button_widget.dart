import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoundButtonWidget extends StatefulWidget {
  @override
  _SoundButtonWidgetState createState() => _SoundButtonWidgetState();
}

class _SoundButtonWidgetState extends State<SoundButtonWidget> {
  bool soundEnabled = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      // TODO: Create method for repeated code for sound button
      child: soundEnabled
          ? Container(
              key: Key('sound-on'),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    soundEnabled = !soundEnabled;
                  });
                  print('Sound Enabled: $soundEnabled');
                },
                child: SvgPicture.asset(
                  'images/sound-on.svg',
                  width: MediaQuery.of(context).size.width / 6.5,
                ),
              ),
            )
          : Container(
              key: Key('sound-off'),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    soundEnabled = !soundEnabled;
                  });
                  print('Sound Enabled: $soundEnabled');
                },
                child: SvgPicture.asset(
                  'images/sound-off.svg',
                  width: MediaQuery.of(context).size.width / 6.5,
                ),
              ),
            ),
    );
  }
}

// class SoundButtonWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: Move soundEnabled variable to service "strooper_preference.dart"
//     bool soundEnabled = true;
//     // TODO: Access soundEnabled variable from "home_view_model.dart"
//     // TODO: set soundEnabled = !soundEnabled
//     // TODO: Update sound icon
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 600),
//       child: soundEnabled
//           ? GestureDetector(
//               onTap: () {
//                 soundEnabled = !soundEnabled;
//                 print('Sound Enabled: $soundEnabled');
//               },
//               child: Container(
//                 key: Key('sound-on'),
//                 child: SvgPicture.asset(
//                   'images/sound-on.svg',
//                   width: MediaQuery.of(context).size.width / 6.5,
//                 ),
//               ),
//             )
//           : Container(
//               key: Key('sound-off'),
//               child: SvgPicture.asset(
//                 'images/sound-off.svg',
//                 width: MediaQuery.of(context).size.width / 6.5,
//               ),
//             ),
//     );
//   }
// }
