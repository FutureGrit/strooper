import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  BounceAnimation(
      {@required this.bounceWidget,
      @required this.onTap,
      this.duration = 180,
      this.disableLongPress = false})
      : assert(bounceWidget != null),
        assert(duration >= 1);

  final Widget bounceWidget;
  final Function onTap;

  /// if [disableLongPress] is true then [onTap] function will be executed at the
  /// beginning of the animation. if it's false then [onTap] function will be
  /// executed after the animation is finished.
  final bool disableLongPress;

  /// [duration] is the length of time this animation should last.
  final int duration;

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  double _scale;

  /// This will be used to avoid multiple tap until animation is not completed
  bool _isTapped = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      upperBound: 0.2,
      lowerBound: 0.0,
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _isTapped = false;
        }
      });

    super.initState();
  }

  Future _performAnimation() async {
    await _animationController.forward();
    await _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animationController.value;
    return IgnorePointer(
      ignoring: _isTapped,
      child: widget.disableLongPress ? _onTapWidget() : _onLongPressWidget(),
    );
  }

  /// [onTapWidget] function will be called if long press gesture is disabled.
  /// This will execute [onTap] function on the beginning of the animation.
  Widget _onTapWidget() {
    return GestureDetector(
      onTap: () async {
        _isTapped = true;
        widget.onTap();
        await _performAnimation();
      },
      child: _animatedWidget,
    );
  }

  /// [onLongPressWidget] function will be called if long press gesture is enabled.
  /// This will execute [onTap] function after the animation is completed.
  Widget _onLongPressWidget() {
    return GestureDetector(
      onTap: () async {
        _isTapped = true;
        await _performAnimation();
        widget.onTap();
      },
      onLongPressStart: (LongPressStartDetails details) =>
          _animationController.forward(),
      onLongPressEnd: (LongPressEndDetails details) async {
        await _animationController.reverse();
        widget.onTap();
      },
      child: _animatedWidget,
    );
  }

  Widget get _animatedWidget => Transform.scale(
        scale: _scale,
        alignment: Alignment.center,
        child: widget.bounceWidget,
      );
}
