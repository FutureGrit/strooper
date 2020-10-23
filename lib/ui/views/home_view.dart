import 'package:flutter/material.dart';

import 'package:strooper/constants/shared_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
