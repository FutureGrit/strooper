import 'package:flutter/material.dart';

import 'package:strooper/router.dart' as router;
import 'package:strooper/constants/route_paths.dart' as routes;

import 'package:strooper/locator.dart';
import 'package:strooper/services/local_db/database_setup.dart';
import 'package:strooper/services/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  /// [DatabaseSetup] will fetch the score saved in local database and load all
  /// the required image assets.
  await DatabaseSetup.initialise();

  runApp(Strooper());
}

class Strooper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'FredokaOne'),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.HomeRoute,
    );
  }
}
