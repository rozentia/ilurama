import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/extensions/extensions.dart';
import '../../../app/routes/routes.dart';
import '../../../entities/color_item/color_item.dart';
import '../../../models/models.dart';
import 'related_colors_block.dart';

class ColorCodeRelationsBlock extends StatelessWidget {
  final String? parentItemName;
  final List<ColorCodeRelation> relations;
  final Map<String, ColorItem> relatedColors;
  const ColorCodeRelationsBlock({
    required this.parentItemName,
    required this.relatedColors,
    required this.relations,
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
            child: 'text_linked_products'.tr().toUpperCase().asSectionHeader,
          ),
          Container(
            color: CupertinoColors.quaternarySystemFill,
            child: Column(
                children: relations
                    .map<Widget?>((colorCodeRelation) {
                      if (colorCodeRelation.productKey == null) return null;
                      final relatedColorItem = relatedColors[colorCodeRelation.productKey];
                      if (relatedColorItem == null) return null;
                      return RelatedColorRow(
                        index: 1,
                        item: relatedColorItem,
                        customDescription: colorCodeRelation.relationDescription,
                        onTap: () => context.router.push(
                          LibraryItemRoute(
                            libraryItemId: relatedColorItem.key,
                            parentRouteShortTitle: parentItemName,
                          ),
                        ),
                      );
                    })
                    .toList()
                    .toNonNull),
          ),
        ],
      ),
    );
  }
}
