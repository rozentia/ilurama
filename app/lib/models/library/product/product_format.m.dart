import 'package:flutter/foundation.dart';
import 'package:ilurama/app/database/constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_format.m.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: DatabaseConstants.adapterIdProductFormat)
class ProductFormat {
  /// Label description of the size ex. roll, sheet, pack etc
  @HiveField(0)
  final String? label;

  /// Width in meters
  @HiveField(1)
  final num? widthM;

  /// Height in meters
  @HiveField(2)
  final num? heightM;

  /// Format of the available size
  @HiveField(3)
  final String? type;

  const ProductFormat({
    required this.label,
    required this.widthM,
    required this.heightM,
    required this.type,
  });

  factory ProductFormat.fromJson(Map<String, dynamic> json) => _$ProductFormatFromJson(json);
  Map<String, dynamic> toJson() => _$ProductFormatToJson(this);
}
