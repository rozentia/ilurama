import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'custom_matches.m.flamingo.dart';

class CustomMatches extends Document<CustomMatches> {
  @Field()
  List<String>? productMatches;

  @Field()
  List<String>? colorCodeMatches;

  CustomMatches({
    this.productMatches,
    this.colorCodeMatches,
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
