import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'glare_hub_meta.m.flamingo.dart';

class IluramaMeta extends Document<IluramaMeta> {
  @Field()
  String? libraryVersion;

  @Field()
  List<String>? changeLog;

  IluramaMeta({
    this.libraryVersion,
    this.changeLog,
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);
}
