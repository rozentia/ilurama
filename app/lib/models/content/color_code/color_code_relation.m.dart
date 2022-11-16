import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'color_code_relation.m.flamingo.dart';

class ColorCodeRelation extends Model {
  @Field()
  String? productKey;

  @Field()
  String? relationDescription;

  ColorCodeRelation({
    this.productKey,
    this.relationDescription,
    Map<String, dynamic>? values,
  }) : super(values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
