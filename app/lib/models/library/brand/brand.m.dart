import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../app/database/constants.dart';

part 'brand.m.g.dart';

@JsonSerializable()
@HiveType(typeId: DatabaseConstants.adapterIdBrand)
class Brand extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String link;

  @HiveField(2)
  List<int>? graphStops;

  @HiveField(3)
  String logo;

  Brand({
    required this.name,
    required this.link,
    required this.graphStops,
    required this.logo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
