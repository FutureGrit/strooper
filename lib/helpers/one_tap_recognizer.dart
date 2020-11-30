import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// [OneTapRecognizer] that can only recognize one gesture at a time. For
/// example, a single [TapGestureRecognizer] can never recognize two taps
/// happening simultaneously, even if multiple pointers are placed on the
/// same widget.
class OneTapRecognizer extends OneSequenceGestureRecognizer {
  int _p = 0;
  @override
  void addPointer(PointerDownEvent event) {
    startTrackingPointer(event.pointer);
    if (_p == 0) {
      resolve(GestureDisposition.rejected);
      _p = event.pointer;
    } else {
      resolve(GestureDisposition.accepted);
    }
  }

  @override
  String get debugDescription => 'Strooper: Recognize one sequence gesture';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    if (!event.down && event.pointer == _p) {
      _p = 0;
    }
  }
}

/// Base class for the game screens where we need to recognize only one tap even
/// multiple tap happening simultaneously.
class OneTapRecognizerWidget extends StatelessWidget {
  final Widget child;
  OneTapRecognizerWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        OneTapRecognizer:
            GestureRecognizerFactoryWithHandlers<OneTapRecognizer>(
          () => OneTapRecognizer(),
          (OneTapRecognizer instance) {},
        ),
      },
      child: child,
    );
  }
}
