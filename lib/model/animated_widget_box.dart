import 'package:hive/hive.dart';
import 'package:rive/rive.dart';

part 'animated_widget_box.g.dart';

@HiveType(typeId: 0)
class AnimatedWidgetBox extends HiveObject {
  @HiveField(0)
  Artboard artboard;

  @HiveField(1)
  Object artboardObj;

  //AnimatedWidgetBox(this.artboard);
}
