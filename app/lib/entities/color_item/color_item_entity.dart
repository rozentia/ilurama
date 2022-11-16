import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ilurama/entities/content_types/content_types.dart';
import 'package:ilurama/models/models.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:path/path.dart' as p;
import 'package:tinycolor2/tinycolor2.dart';

class ColorItem {
  final Product? _product;
  final ColorCode? _colorCode;
  const ColorItem._(this._product, this._colorCode);

  ColorItemType get type {
    if ((_product?.isTechnical ?? false) && !(_product?.isColor ?? true)) return const TechnicalFilter();
    if (_product?.isDifussion ?? false) return const DiffusionFilter();
    if (_product?.isGlass ?? false) return const GlassFilter();
    return const ColorFilter();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ColorItem && runtimeType == other.runtimeType && hashCode == other.hashCode;

  @override
  int get hashCode => (_product?.hashCode ?? _colorCode?.hashCode).hashCode;

  ///@ The original item: either a color code or a product item
  Either<Product, ColorCode> get item => _product != null ? Left(_product!) : Right(_colorCode!);

  ///@ The key (for product) or the document id (for color code)
  String get key => item.fold((product) => product.key, (colorCode) => colorCode.id);

  ///@ The name of the product or color code item
  String get name => _product?.name ?? _colorCode?.name ?? 'text_item_has_no_name'.tr();

  ///@ The description of the product or the color code item
  Option<String> get description => optionOf(_product?.description ?? _colorCode?.description);

  ///@ The image representation of the product (null if item is a color code item)
  String? get imageFileName => _product?.image != null ? p.basename(_product!.image!) : null;

  ///@ The product code of the item (empty string if item is a color code item)
  String get itemCode => _product?.code ?? '';

  ///@ Graph data of the product item if available
  Option<List<num?>> get graphData {
    if (_product == null) return none();
    if (_product!.graphData == null) return none();
    if (_product!.graphData!.isEmpty) return none();
    return some(_product!.graphData!);
  }

  bool get isProduct => item.isLeft();
  bool get isColorCode => item.isRight();

  ///@ The color representation of the item as hex string, null if the string cannot be resolved)
  String? get colorHexString {
    final RegExp hexColor =
        RegExp(r'#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})'); // RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
    return hexColor.firstMatch(_product?.color ?? '#ffffff')?.group(0) ??
        hexColor.firstMatch(_colorCode?.hex ?? '#ffffff')?.group(0) ??
        '#FFFFFF';
  }

  ///@
  Color get color => colorHexString != null ? TinyColor.fromString(colorHexString!).color : Colors.transparent;

  ///@
  static ColorItem fromProduct(Product product) => ColorItem._(product, null);

  ///@
  static ColorItem fromColorCode(ColorCode colorCode) => ColorItem._(null, colorCode);
}
