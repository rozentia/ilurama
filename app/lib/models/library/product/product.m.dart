import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:ilurama/app/database/constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tinycolor2/tinycolor2.dart';

import 'product_format.m.dart';
import 'transmission_data.m.dart';

part 'product.m.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: DatabaseConstants.adapterIdProduct)
class Product {
  /// Unique color code of the filter
  @HiveField(0)
  final String code;

  /// Name of the color
  @HiveField(1)
  final String? name;

  /// The manufacturer brand name
  @HiveField(2)
  final String brand;

  /// Description about the color
  @HiveField(3)
  final String? description;

  /// Color code in hex
  @HiveField(4)
  final String? color;

  /// Manufacturer branch
  @HiveField(5)
  final String? branch;

  /// Url link to filter details
  @HiveField(6)
  final String? link;

  /// Representative image as alternative for non colored filter
  @HiveField(7)
  final String? image;

  /// Unabridged specs
  @HiveField(8)
  final String? specs;

  /// The formats this filter is available, ex. rolls, sheets, packs...
  @HiveField(9)
  final List<ProductFormat>? formats;

  /// The light transmission for a given source in the format { "sourceName";
  @HiveField(10)
  final List<TransmissionData>? transmission;

  /// Any matching dichroic filter of the same brand
  @HiveField(11)
  final String? dichroicMatches;

  /// Ids of similar products from other brands
  @HiveField(12)
  final List<String>? externalMatches;

  /// Graph data
  @HiveField(13)
  final List<num?>? graphData;

  /// True if product is a color filter
  @HiveField(14)
  final bool isColor;

  /// True if product is a diffuse filter
  @HiveField(15)
  final bool isDifussion;

  /// True if product is a dichroic glass filter
  @HiveField(16)
  final bool isGlass;

  /// True if product is a technical filter
  @HiveField(17)
  final bool isTechnical;

  const Product({
    required this.code,
    this.branch,
    required this.brand,
    required this.color,
    this.description,
    this.dichroicMatches,
    this.externalMatches,
    this.formats,
    this.graphData,
    this.image,
    this.isColor = false,
    this.isDifussion = false,
    this.isGlass = false,
    this.isTechnical = false,
    this.link,
    required this.name,
    this.specs,
    this.transmission,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.unknown() => const Product(code: '', brand: 'Unknown', color: '#FFFFFF', name: 'Unknown');

  ///@ Returns the key of the product as stated by the JSON data file: [brand]-[code]
  String get key => '$brand-$code';

  @override
  String toString() => [
        'name: $name',
        'code: $code',
        'brand: $brand',
        'branch: $branch',
        'color: $color',
        'description: $description',
        'dichroicMatches: $dichroicMatches',
        'externalMatches: $externalMatches',
        'formats: $formats',
        'graphData: $graphData',
        'image: $image',
        'isColor: $isColor',
        'isDifussion: $isDifussion',
        'isGlass: $isGlass',
        'link: $link',
        'specs: $specs',
        'transmission: $transmission',
      ].join('\n');

  @override
  int get hashCode => '$brand-$code'.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          code == other.code &&
          brand == other.brand;

  ///@ Get safe color hex string or white
  String get colorHexString {
    final RegExp hexColor = RegExp(r'#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})');
    return hexColor.firstMatch(color ?? '#ffffff')?.group(0) ?? '#FFFFFF';
  }

  ///@ Get safe color
  Color get safeColor => TinyColor.fromString(colorHexString).color;
}
