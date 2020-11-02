import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/router.dart' as router;
import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/home/home_view_model.dart';
import 'package:strooper/services/navigation_service.dart';

import 'home/home_view.dart';

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
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: HomeView(),
      ),
    );
  }
}
