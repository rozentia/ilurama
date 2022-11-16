import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../app/extensions/extensions.dart';
import '../../../app/routes/routes.dart';
import '../../../entities/color_item/color_item.dart';
import '../../widgets/widgets.dart';

class RelatedColorsBlock extends StatelessWidget {
  final Map<String, List<ColorItem>> relatedColors;
  final String? parentItemName;

  const RelatedColorsBlock(
    this.relatedColors, {
    @required this.parentItemName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        children: relatedColors.entries.fold<List<Widget>>(
            <Widget>[],
            (prev, element) => element.value.isEmpty
                ? prev
                : [
                    ...prev,
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: element.key.tr().asSectionHeader,
                    ),
                    Container(
                        color: CupertinoColors.quaternarySystemFill,
                        child: Column(
                          children: element.value
                              .map<Widget>((colorItem) => RelatedColorRow(
                                    index: 1,
                                    item: colorItem,
                                    onTap: () => context.router.push(
                                      LibraryItemRoute(
                                        libraryItemId: colorItem.key,
                                        parentRouteShortTitle: parentItemName,
                                      ),
                                    ),
                                    // showCupertinoModalBottomSheet(
                                    //     context: context, builder: (context) => LibraryItemView(colorItem)),
                                  ))
                              .toList(),
                        ))
                  ]).toList(),
      ),
    );
  }
}

class RelatedColorRow extends StatelessWidget {
  const RelatedColorRow({
    Key? key,
    required this.item,
    required this.index,
    this.onTap,
    this.customDescription,
  }) : super(key: key);

  final ColorItem item;
  final int index;
  final String? customDescription;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IluramaTableRow(
      key: Key('$index-${item.name}-${item.itemCode}'),
      title: item.name,
      subtitleText: customDescription ?? item.description.fold(() => '', (a) => a),
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SizedBox.square(dimension: 40, child: ColorFilterRepresentation(item.color, item.itemCode)),
      ),
      onTap: onTap,
    );
  }
}
