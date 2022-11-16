import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'collection.m.flamingo.dart';

class Collection extends Document<Collection> {
  @Field()
  String? owner;

  @Field()
  String? name;

  @Field(isWriteNotNull: false)
  String? description;

  @Field()
  List<String>? products;

  @Field()
  List<String>? colorCodes;

  Collection({
    this.owner,
    this.name,
    this.description,
    this.products,
    this.colorCodes,
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  // Future<List<Color>> getColors() async {
  //   final lib = getIt<LibraryServiceInterface>();
  //   final productColors = lib
  //       .productsForKeys(products ?? [])
  //       .fold<List<Product>>(
  //           [], (list, possibleProduct) => possibleProduct.fold(() => list, (product) => [...list, product]))
  //       .map<Color>((product) => product.safeColor)
  //       .toList();
  //   return [...productColors];
  // }
}
