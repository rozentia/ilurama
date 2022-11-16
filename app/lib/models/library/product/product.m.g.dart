// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      code: fields[0] as String,
      branch: fields[5] as String?,
      brand: fields[2] as String,
      color: fields[4] as String?,
      description: fields[3] as String?,
      dichroicMatches: fields[11] as String?,
      externalMatches: (fields[12] as List?)?.cast<String>(),
      formats: (fields[9] as List?)?.cast<ProductFormat>(),
      graphData: (fields[13] as List?)?.cast<num?>(),
      image: fields[7] as String?,
      isColor: fields[14] as bool,
      isDifussion: fields[15] as bool,
      isGlass: fields[16] as bool,
      isTechnical: fields[17] as bool,
      link: fields[6] as String?,
      name: fields[1] as String?,
      specs: fields[8] as String?,
      transmission: (fields[10] as List?)?.cast<TransmissionData>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.branch)
      ..writeByte(6)
      ..write(obj.link)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.specs)
      ..writeByte(9)
      ..write(obj.formats)
      ..writeByte(10)
      ..write(obj.transmission)
      ..writeByte(11)
      ..write(obj.dichroicMatches)
      ..writeByte(12)
      ..write(obj.externalMatches)
      ..writeByte(13)
      ..write(obj.graphData)
      ..writeByte(14)
      ..write(obj.isColor)
      ..writeByte(15)
      ..write(obj.isDifussion)
      ..writeByte(16)
      ..write(obj.isGlass)
      ..writeByte(17)
      ..write(obj.isTechnical);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      code: json['code'] as String,
      branch: json['branch'] as String?,
      brand: json['brand'] as String,
      color: json['color'] as String?,
      description: json['description'] as String?,
      dichroicMatches: json['dichroicMatches'] as String?,
      externalMatches: (json['externalMatches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      formats: (json['formats'] as List<dynamic>?)
          ?.map((e) => ProductFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      graphData:
          (json['graphData'] as List<dynamic>?)?.map((e) => e as num?).toList(),
      image: json['image'] as String?,
      isColor: json['isColor'] as bool? ?? false,
      isDifussion: json['isDifussion'] as bool? ?? false,
      isGlass: json['isGlass'] as bool? ?? false,
      isTechnical: json['isTechnical'] as bool? ?? false,
      link: json['link'] as String?,
      name: json['name'] as String?,
      specs: json['specs'] as String?,
      transmission: (json['transmission'] as List<dynamic>?)
          ?.map((e) => TransmissionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'brand': instance.brand,
      'description': instance.description,
      'color': instance.color,
      'branch': instance.branch,
      'link': instance.link,
      'image': instance.image,
      'specs': instance.specs,
      'formats': instance.formats,
      'transmission': instance.transmission,
      'dichroicMatches': instance.dichroicMatches,
      'externalMatches': instance.externalMatches,
      'graphData': instance.graphData,
      'isColor': instance.isColor,
      'isDifussion': instance.isDifussion,
      'isGlass': instance.isGlass,
      'isTechnical': instance.isTechnical,
    };
