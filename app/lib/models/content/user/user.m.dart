import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import '../custom_matches/custom_matches.m.dart';

part 'user.m.flamingo.dart';

class User extends Document<User> {
  @Field()
  String? bio;

  @Field()
  List<String>? following;

  @SubCollection()
  late Collection<CustomMatches> customMatches;

  User(
      {this.bio,
      this.following,
      String? id,
      DocumentSnapshot<Map<String, dynamic>>? snapshot,
      Map<String, dynamic>? values,
      CollectionReference<Map<String, dynamic>>? collectionRef})
      : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef: collectionRef,
        ) {
    customMatches = Collection(this, UserKey.customMatches.value);
  }

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  ///@ Saves the current instance
  Future<User> save() => DocumentAccessor().save(this).then((_) => this);
}
