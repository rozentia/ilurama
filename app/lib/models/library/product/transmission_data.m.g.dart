// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transmission_data.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransmissionDataAdapter extends TypeAdapter<TransmissionData> {
  @override
  final int typeId = 2;

  @override
  TransmissionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransmissionData(
      source: fields[0] as String?,
      Y: fields[1] as num?,
      y: fields[2] as num?,
      x: fields[3] as num?,
      absortion: fields[4] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, TransmissionData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.Y)
      ..writeByte(2)
      ..write(obj.y)
      ..writeByte(3)
      ..write(obj.x)
      ..writeByte(4)
      ..write(obj.absortion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransmissionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransmissionData _$TransmissionDataFromJson(Map<String, dynamic> json) =>
    TransmissionData(
      source: json['source'] as String?,
      Y: json['Y'] as num?,
      y: json['y'] as num?,
      x: json['x'] as num?,
      absortion: json['absortion'] as num?,
    );

Map<String, dynamic> _$TransmissionDataToJson(TransmissionData instance) =>
    <String, dynamic>{
      'source': instance.source,
      'Y': instance.Y,
      'y': instance.y,
      'x': instance.x,
      'absortion': instance.absortion,
    };
