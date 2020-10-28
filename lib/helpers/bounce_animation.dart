import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  BounceAnimation({@required this.bounceWidget, @required this.onTap});

  final Widget bounceWidget;
  final Function onTap;

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

// TODO: Improve animation performance by eliminating multiple calls from on tap event
// TODO: Enhancement = Improve bounce effect eg. add grow and shrink effect on tap up
class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  double _scale;

  bool isPressed = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 180),
      lowerBound: 0.0,
      upperBound: 0.1,
      vsync: this,
    )
      ..addListener(() {
        // TODO: Set state or execute function based on animation status
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && !isPressed) {
          print('Inside Animation Status completed');
          _animationController.reverse();
          widget.onTap();
        }
      });

    // Use end: -2 to flip the image
    _animation = Tween<double>(begin: 1, end: .8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut));

    // _animation = CurvedAnimation(
    //     parent: _animationController, curve: Curves.bounceInOut);
    // _animationController.forward();
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
      onTap: () {
        print('ON TAP Calledx');
        _animationController.forward();
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: ScaleTransition(
        scale: _animation,
        alignment: Alignment.center,
        //scale: _scale,
        //Curves.elasticInOut.,
        //ElasticInOutCurve().transform(_scale), //animation,//Curves.elasticInOut,//_scale,
        child: widget.bounceWidget,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    print('Tap Down calledxY');
    isPressed = true;
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    print('Tap Up calledxY');
    isPressed = false;
    _animationController.reverse();
  }
}
