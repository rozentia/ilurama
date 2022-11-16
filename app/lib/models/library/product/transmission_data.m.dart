import 'package:flutter/foundation.dart';
import 'package:ilurama/app/database/constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transmission_data.m.g.dart';

@JsonSerializable()
@immutable
@HiveType(typeId: DatabaseConstants.adapterIdTransmissionData)
class TransmissionData {
  @HiveField(0)
  final String? source;

  @HiveField(1)
  final num? Y;

  @HiveField(2)
  final num? y;

  @HiveField(3)
  final num? x;

  @HiveField(4)
  final num? absortion;

  const TransmissionData({
    required this.source,
    required this.Y,
    required this.y,
    required this.x,
    required this.absortion,
  });

  factory TransmissionData.fromJson(Map<String, dynamic> json) => _$TransmissionDataFromJson(json);
  Map<String, dynamic> toJson() => _$TransmissionDataToJson(this);
}
