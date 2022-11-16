// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrandAdapter extends TypeAdapter<Brand> {
  @override
  final int typeId = 3;

  @override
  Brand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brand(
      name: fields[0] as String,
      link: fields[1] as String,
      graphStops: (fields[2] as List?)?.cast<int>(),
      logo: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Brand obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.graphStops)
      ..writeByte(3)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      name: json['name'] as String,
      link: json['link'] as String,
      graphStops:
          (json['graphStops'] as List<dynamic>?)?.map((e) => e as int).toList(),
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'graphStops': instance.graphStops,
      'logo': instance.logo,
    };
