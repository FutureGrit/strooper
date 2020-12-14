import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToRemoveUntil(
      {@required String navigateTo,
      @required String removeUntil,
      dynamic argument}) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
        navigateTo, ModalRoute.withName(removeUntil),
        arguments: argument);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
