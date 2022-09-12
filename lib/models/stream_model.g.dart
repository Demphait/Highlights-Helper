// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StreamModelAdapter extends TypeAdapter<StreamModel> {
  @override
  final int typeId = 0;

  @override
  StreamModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StreamModel(
      name: fields[0] as String,
      date: fields[1] as String,
      time: fields[2] as String,
      highlights: (fields[3] as List).cast<HighlightModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, StreamModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.highlights);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
