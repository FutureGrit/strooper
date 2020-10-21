import 'package:flutter/material.dart';

void main() {
  runApp(Strooper());
}

class Strooper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: Text(
              'Strooper',
              style: TextStyle(fontSize: 30, color: Colors.orange),
            ),
          ),
        ),
      ),
    );
  }
}
