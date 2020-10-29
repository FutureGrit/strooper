import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  BounceAnimation({@required this.bounceWidget, @required this.onTap});

  final Widget bounceWidget;
  final Function onTap;

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _scale;

  bool isTapped = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 180),
      lowerBound: 0.0,
      upperBound: 0.2,
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        /// Reverse animation only if button is tapped not on long press as
        /// we are already doing reverse animation on long press end
        if (status == AnimationStatus.completed && isTapped) {
          _animationController.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          isTapped = false;
          widget.onTap();
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animationController.value;
    return GestureDetector(
      onTap: !isTapped ? _onTap : null,
      onLongPressStart: _onLongPressStart,
      onLongPressEnd: _onLongPressEnd,
      child: Transform.scale(
        scale: _scale,
        alignment: Alignment.center,
        child: widget.bounceWidget,
      ),
    );
  }

  void _onTap() {
    isTapped = true;
    _animationController.forward();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _animationController.forward();
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    _animationController.reverse();
  }
}
