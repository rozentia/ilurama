import 'dart:ui';

import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:tinycolor2/tinycolor2.dart';

import 'color_code_parameter.m.dart';
import 'color_code_parameter_types.dart';
import 'color_code_relation.m.dart';

part 'color_code.m.flamingo.dart';

class ColorCode extends Document<ColorCode> {
  @Field()
  String? owner;

  @Field()
  String? name;

  @Field(isWriteNotNull: false)
  String? description;

  @Field()
  String? hex;

  @ModelField()
  List<ColorCodeParameter>? parameters;

  @ModelField()
  List<ColorCodeRelation>? relatedProducts;

  ColorCode({
    this.owner,
    this.name,
    this.description,
    this.hex,
    this.parameters,
    this.relatedProducts,
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  /// Return a list of all parameterType this color code contains
  List<ColorCodeParameterType> get parameterTypes =>
      (parameters ?? []).map((parameter) => parameter.parameterType).toList().toNonNull;

  ///@ Get safe color hex string or white
  String get colorHexString {
    final RegExp hexColor = RegExp(r'#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})');
    return hexColor.firstMatch(hex ?? '#ffffff')?.group(0) ?? '#FFFFFF';
  }

  ///@ Get safe color
  Color get safeColor => TinyColor.fromString(colorHexString).color;
}
