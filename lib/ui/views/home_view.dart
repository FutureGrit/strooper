import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: appBackgroundDecoration,
        child: Center(
          child: Text(
            'Strooper',
            style: TextStyle(fontSize: 30, color: Colors.orange),
          ),
        ),
      ),
    );
  }
}
