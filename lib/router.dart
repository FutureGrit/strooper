import 'package:flutter/material.dart';

import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/home/home_view.dart';
import 'package:strooper/model/game_over.dart';
import 'package:strooper/play/play_view.dart';
import 'package:strooper/views/game_over/game_over_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case routes.PlayRoute:
      return MaterialPageRoute(builder: (context) => PlayView());
    case routes.GameOverRoute:
      GameOver scoreDetails = settings.arguments as GameOver;
      return MaterialPageRoute(
        builder: (context) => GameOverView(
          scoreDetails: scoreDetails,
        ),
      );
    default:
      return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      body: Container(
        color: Colors.brown,
        child: Center(
          child: Text(
            'SCREEN NOT FOUND',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  });
}
