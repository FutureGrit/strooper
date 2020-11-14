import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strooper/home/home_view.dart';

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/database_setup.dart';

import 'package:strooper/services/navigation_service.dart';
import 'package:strooper/router.dart' as router;
import 'package:strooper/home/widgets/splash_widget.dart';

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
      home: FutureBuilder(
        future: DatabaseSetup.initialise(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return HomeView();
          } else {
            return SplashWidget();
          }
        },
      ),
    );
  }
}
