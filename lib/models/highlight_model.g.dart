// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HighlightModelAdapter extends TypeAdapter<HighlightModel> {
  @override
  final int typeId = 1;

  @override
  HighlightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HighlightModel(
      time: fields[0] as String,
      isAfk: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HighlightModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.isAfk);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HighlightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
