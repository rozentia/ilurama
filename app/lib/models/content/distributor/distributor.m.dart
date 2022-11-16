import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'distributor.m.flamingo.dart';

class Distributor extends Document<Distributor> {
  @Field()
  String? name;

  @Field()
  String? link;

  @Field(isWriteNotNull: false)
  String? description;

  @Field()
  String? location;

  @Field()
  List<String>? brands;

  Distributor({
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
