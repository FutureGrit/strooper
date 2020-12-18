import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import 'button_animation_controller.dart';

class AnimatedButtonWidget extends StatefulWidget {
  AnimatedButtonWidget({this.onTap});
  final Function onTap;

  @override
  _AnimatedButtonWidgetState createState() => _AnimatedButtonWidgetState();
}

class _AnimatedButtonWidgetState extends State<AnimatedButtonWidget> {
  Artboard _artboard;
  ButtonAnimationController _controller;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/start_button.riv');
    final file = RiveFile();
    if (file.import(bytes)) {
      setState(
        () => _artboard = file.mainArtboard
          ..addController(_controller = ButtonAnimationController()),
      );

      _controller.isActiveChanged.addListener(() {
        if (!_controller.isActive) {
          //TODO: Add method to execute once animation is finished
          WidgetsBinding.instance.addPostFrameCallback((_) => widget.onTap());
          print('----------- End of animation -------------');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _artboard != null
          ? Rive(artboard: _artboard, alignment: Alignment.center)
          : Container(),
      onTap: () {
        if (!_controller.isActive) {
          setState(() {
            _controller.isActive = !_controller.isActive;
          });
        }
      },
    );
  }
}
