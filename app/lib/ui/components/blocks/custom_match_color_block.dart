import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/extensions/extensions.dart';
import '../../../app/routes/routes.dart';
import '../../../entities/color_item/color_item.dart';
import 'related_colors_block.dart';

class CustomMatchColorsBlock extends StatelessWidget {
  final String? parentItemName;
  final List<ColorItem> relatedColors;
  const CustomMatchColorsBlock(
    this.relatedColors, {
    @required this.parentItemName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: 'title_custom_alternatives'.tr().asSectionHeader,
          ),
          Container(
            color: CupertinoColors.quaternarySystemFill,
            child: Column(
              children: relatedColors
                  .map<Widget>(
                    (colorItem) => RelatedColorRow(
                      index: 1,
                      item: colorItem,
                      onTap: () => context.router.push(
                        LibraryItemRoute(libraryItemId: colorItem.key, parentRouteShortTitle: parentItemName),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
