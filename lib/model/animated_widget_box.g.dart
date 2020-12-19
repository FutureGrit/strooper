// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animated_widget_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimatedWidgetBoxAdapter extends TypeAdapter<AnimatedWidgetBox> {
  @override
  final int typeId = 0;

  @override
  AnimatedWidgetBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimatedWidgetBox()
      ..artboard = fields[0] as Artboard
      ..artboardObj = fields[1] as Object;
  }

  @override
  void write(BinaryWriter writer, AnimatedWidgetBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.artboard)
      ..writeByte(1)
      ..write(obj.artboardObj);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimatedWidgetBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
