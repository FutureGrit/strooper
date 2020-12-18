import 'package:rive/rive.dart';

class ButtonAnimationController
    extends RiveAnimationController<RuntimeArtboard> {
  RuntimeArtboard _artboard;

  /// Button animation (eg: bounce etc...)  variable
  LinearAnimationInstance _instance;

  Function onTap = () {};

  @override
  bool init(RuntimeArtboard artboard) {
    _artboard = artboard;
    _instance = getInstance(artboard, animationName: 'bounce');
    _instance.animation.loop = Loop.oneShot;

    return _instance != null;
  }

  LinearAnimationInstance getInstance(RuntimeArtboard artboard,
      {String animationName}) {
    var animation = artboard.animations.firstWhere(
      (animation) =>
          animation is LinearAnimation && animationName == animationName,
      orElse: () => null,
    );
    if (animation != null) {
      return LinearAnimationInstance(animation as LinearAnimation);
    }
    return null;
  }

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    print('[1]------- Apply Method Called: ${_instance.time} ------------');
    _instance.animation.apply(_instance.time, coreContext: artboard);
    _instance.advance(elapsedSeconds);

    if (!_instance.advance(elapsedSeconds)) {
      isActive = false;
      _reset();
      print('----------- isActive = $isActive -----------');
    }
  }

  void _reset() {
    print(
        '[1]------- Reset Method Called: ${_instance.time} ----WorkStart: ${_instance.animation.workStart.toDouble()}--------');
    _instance.time = _instance.animation.workStart.toDouble();
    _instance.animation.apply(0, coreContext: _artboard);
  }
}
