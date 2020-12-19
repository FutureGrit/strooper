import 'package:hive/hive.dart';
import 'package:rive/rive.dart';

import 'animated_widget_box.dart';

class AnimationWidgetBoxAdapter extends TypeAdapter<AnimatedWidgetBox> {
  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  AnimatedWidgetBox read(BinaryReader reader) {
    return AnimatedWidgetBox()..artboard = reader.read();
  }

  @override
  void write(BinaryWriter writer, AnimatedWidgetBox obj) {
    writer.write(obj.artboard);
  }
}
