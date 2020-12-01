import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> popAndNavigateTo(String routeName, {dynamic argument}) {
    return navigatorKey.currentState
        .popAndPushNamed(routeName, arguments: argument);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
