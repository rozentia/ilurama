import 'package:ilurama/app/constants/constants.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../color_item/color_item_entity.dart';
import '../filter_settings/library_filter_settings.dart';

extension ExtendedColorItemList on List<ColorItem> {
  List<ColorItem> applyLibraryFilter(LibraryFilterSettings settings) =>
      //= Filter by search term
      where(
        (colorItem) => settings.searchTerm != null
            ? settings.searchTerm!.isNotEmpty
                ? colorItem.name.toLowerCase().contains(settings.searchTerm!.toLowerCase()) ||
                    colorItem.description.fold<bool>(() => false,
                        (description) => description.toLowerCase().contains(settings.searchTerm!.toLowerCase()))
                : true
            : true,
      )
          //= Filter by brand
          .where(
            (colorItem) => settings.showBrands.isEmpty
                ? true
                : colorItem.item.fold<bool>(
                    (product) => settings.showBrands.contains(product.brand),
                    (colorCode) => settings.showBrands.contains(kUserBrandLabel),
                  ),
          )
          //= Filter by type
          .where(
            (colorItem) => settings.showTypes.isEmpty ? true : settings.showTypes.contains(colorItem.type),
          )
          //= Filter by color range
          .where(
            (colorItem) => settings.hue == null
                ? true
                : HSVColor.fromColor(colorItem.color).hue >= settings.hue! - 20.0 &&
                    HSVColor.fromColor(colorItem.color).hue <= settings.hue! + 20.0 &&
                    colorItem.color != Colors.white,
          )
          .toList();
}
