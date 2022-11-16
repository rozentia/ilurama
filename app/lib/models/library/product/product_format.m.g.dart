// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_format.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductFormatAdapter extends TypeAdapter<ProductFormat> {
  @override
  final int typeId = 1;

  @override
  ProductFormat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductFormat(
      label: fields[0] as String?,
      widthM: fields[1] as num?,
      heightM: fields[2] as num?,
      type: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductFormat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.widthM)
      ..writeByte(2)
      ..write(obj.heightM)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductFormatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFormat _$ProductFormatFromJson(Map<String, dynamic> json) =>
    ProductFormat(
      label: json['label'] as String?,
      widthM: json['widthM'] as num?,
      heightM: json['heightM'] as num?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ProductFormatToJson(ProductFormat instance) =>
    <String, dynamic>{
      'label': instance.label,
      'widthM': instance.widthM,
      'heightM': instance.heightM,
      'type': instance.type,
    };
