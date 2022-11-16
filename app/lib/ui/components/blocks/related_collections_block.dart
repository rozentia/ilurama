import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../app/extensions/extensions.dart';
import '../../../app/routes/router.gr.dart';
import '../../../models/models.dart';
import '../../helpers/helpers.dart';
import '../../widgets/widgets.dart';

class RelatedCollectionsBlock extends StatelessWidget {
  final List<Collection> relatedCollections;
  final String? parentItemName;

  const RelatedCollectionsBlock(
    this.relatedCollections, {
    Key? key,
    @required this.parentItemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: [
            'title_found_in_collections'.tr().asSectionHeader,
            const SizedBox(height: 5),
            Container(
              color: CupertinoColors.quaternarySystemFill,
              child: Column(
                children: relatedCollections
                    .map((collection) => FutureBuilder<List<Color>>(
                          future: getColorsForCollection(collection),
                          builder: (context, AsyncSnapshot<List<Color>> snapshot) => CollectionRow(
                            collection,
                            parentItemName: parentItemName,
                            collectionColors:
                                (snapshot.data ?? [secondaryColor(context), baseColor(context)]).seamlessSweep,
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ));
  }
}

class CollectionRow extends StatelessWidget {
  final VoidCallback? onTap;
  final Collection doc;
  final List<Color> collectionColors;
  final String? parentItemName;

  const CollectionRow(
    this.doc, {
    Key? key,
    required this.collectionColors,
    this.onTap,
    @required this.parentItemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IluramaTableRow(
      onTap: () => onTap != null
          ? onTap!()
          : context.router.push(
              CollectionItemRoute(
                collectionId: doc.id,
                parentRouteShortTitle: parentItemName,
              ),
            ),
      key: Key(doc.id),
      title: doc.name,
      subtitleText: doc.description,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CollectionColorsRepresentation(collectionColors),
      ),
    );
  }
}
