import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pinkAccent,
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
