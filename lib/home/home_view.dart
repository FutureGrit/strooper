import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/enums/strooper_actions.dart';
import 'package:strooper/helpers/bounce_animation.dart';
import 'package:strooper/home/home_view_model.dart';
import 'package:strooper/home/sound_methods.dart';
import 'package:strooper/home/sound_view_model.dart';
import 'package:strooper/home/widgets/app_bar_widget.dart';
import 'package:strooper/home/widgets/cloud_widget.dart';
import 'package:strooper/locator.dart';
import 'package:strooper/play/play_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
//    with WidgetsBindingObserver
{
  /// To access 'BuildContext' that does include the provider so it can be used
  /// in accessing view model in life cycle states.
  //BuildContext modelBuildContext;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //
  //   HomeViewModel homeViewModel =
  //       Provider.of<HomeViewModel>(modelBuildContext, listen: false);
  //
  //   // TODO: Use switch to check the state
  //   if (state == AppLifecycleState.paused) {
  //     // went to Background
  //     homeViewModel.pauseBackgroundMusic();
  //   }
  //
  //   if (state == AppLifecycleState.resumed) {
  //     // came back to Foreground
  //     homeViewModel.resumeBackgroundMusic();
  //   }
  //
  //   if (state == AppLifecycleState.inactive) {
  //     // inactive because split-screen app, a phone call etc...
  //     homeViewModel.pauseBackgroundMusic();
  //   }
  // }

  // TODO: exit on back button pressed twice
  @override
  Widget build(BuildContext context) {
    print('^^^^^^^^^^^^^^^^^^^ Inside home_view ^^^^^^^^^^^^^^^^^');
    // TODO: Pre load all required image assets
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: appBackgroundDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWidget(),

              // App title "STROOPER"
              SvgPicture.asset(
                'images/app_title.svg',
                // TODO: Move media query in [ui_helper] file
                width: MediaQuery.of(context).size.width / 1.3,
              ),

              // Start button
              BounceAnimation(
                bounceWidget: SvgPicture.asset(
                  'images/start_button.svg',
                  width: MediaQuery.of(context).size.width / 2.2,
                ),
                onTap: () {
                  print(
                      '************ Play start button sound *****************');
                  SoundMethods.playButtonSound(
                      action: StrooperActions.START_GAME);
                  // SoundViewModel soundViewModel = locator<SoundViewModel>();
                  // soundViewModel.playButtonSound(
                  //     action: StrooperActions.START_GAME);
                  // soundViewModel.sta
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayView()));
                  //model.startGame();
                  // Provider.of<HomeViewModel>(context, listen: false)
                  //     .startGame();
                },
                // TODO: add duration parameter
              ),

              // Clouds and "@FutureGrit" label
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CloudWidget(),
                  Padding(
                    padding: const EdgeInsets.all(paddingSmall),
                    child: Text(
                      '@FutureGrit',
                      style: watermarkStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Confirmation alert dialog to exit from game, when back button is pressed
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Warning'),
        content: Text('Do you really want to exit from STROOPER Game?'),
        actions: [
          FlatButton(
            child: Text('YES'),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            child: Text('NO'),
            onPressed: () => Navigator.pop(context, false),
          )
        ],
      ),
    );
  }
}
