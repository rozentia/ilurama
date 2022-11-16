import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import '../../../app/constants/constants.dart';

part 'scene.m.flamingo.dart';

class Scene extends Document<Scene> {
  @Field()
  String? owner;

  @Field()
  String? title;

  @Field(isWriteNotNull: false)
  String? description;

  @Field()
  List<String>? products;

  @Field()
  List<String>? colorCodes;

  @StorageField(folderName: kFBStorageUserSceneImagesFolderName)
  List<StorageFile>? images;

  Scene({
    this.owner,
    this.colorCodes,
    this.description,
    this.images,
    this.products,
    this.title,
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
