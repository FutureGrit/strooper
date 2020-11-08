import 'package:flutter/material.dart';

import 'package:strooper/screens/splash/splash_view_model.dart';
import 'package:strooper/home/home_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SplashViewModel.initialise(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return HomeView();
          }
        } else {
          return splashViewWidget();
        }
      },
    );
  }

  Widget splashViewWidget() {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Loading...',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
