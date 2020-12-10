import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/router.dart' as router;
import 'package:strooper/constants/route_paths.dart' as routes;

void main() {
  setupLocator();
  runApp(Strooper());
}

class Strooper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hide status bar and enable full screen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      theme: ThemeData(fontFamily: 'FredokaOne'),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.SplashRoute,
    );
  }
}
