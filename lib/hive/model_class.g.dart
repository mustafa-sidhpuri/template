// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelClassAdapter extends TypeAdapter<ModelClass> {
  @override
  final int typeId = 0;

  @override
  ModelClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelClass()
      ..feature1 = fields[0] as String
      ..feature2 = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, ModelClass obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.feature1)
      ..writeByte(1)
      ..write(obj.feature2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
