import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:strooper/constants/route_paths.dart' as routes;
import 'package:strooper/helpers/custom_page_route.dart';
import 'package:strooper/model/game_over.dart';

import 'package:strooper/views/game_over/game_over_view.dart';
import 'package:strooper/views/home/home_view.dart';
import 'package:strooper/views/instruction/instruction_view.dart';
import 'package:strooper/views/play/play_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomeRoute:
      return SharedAxisPageRoute(
          page: HomeView(),
          transitionType: SharedAxisTransitionType.scaled,
          settings: settings);
      break;
    case routes.InstructionRoute:
      return SharedAxisPageRoute(
          page: InstructionView(),
          transitionType: SharedAxisTransitionType.scaled,
          settings: settings);
      break;
    case routes.PlayRoute:
      return SharedAxisPageRoute(
          page: PlayView(),
          transitionType: SharedAxisTransitionType.scaled,
          settings: settings);
      break;
    case routes.GameOverRoute:
      GameOver scoreDetails = settings.arguments as GameOver;
      return SharedAxisPageRoute(
          page: GameOverView(scoreDetails: scoreDetails),
          transitionType: SharedAxisTransitionType.scaled,
          settings: settings);
      break;
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
