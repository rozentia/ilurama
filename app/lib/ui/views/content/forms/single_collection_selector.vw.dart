import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/extensions/extensions.dart';
import '../../../../models/models.dart';
import '../../../widgets/widgets.dart';
import 'collection_selector.vm.dart';

/// Pops with Collection?
class SingleCollectionSelectorView extends StatelessWidget {
  const SingleCollectionSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTermController = TextEditingController();
    return ViewModelBuilder<CollectionSelectorViewModel>.reactive(
        viewModelBuilder: () => CollectionSelectorViewModel(searchTermController),
        builder: (context, model, child) {
          const searchBarHeight = 35.0;
          return IluramaFrostedScaffold(
            appBarAlwaysVisible: true,
            appBarForegroundAlwaysVisible: true,
            appbarHeight: searchBarHeight + 20 + 37 + 30,
            customAppbarForeground: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                      child: Row(
                        children: [
                          //W! Close Button
                          IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                            alignment: Alignment.centerLeft,
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(CupertinoIcons.xmark_circle, color: criticalColor(context)),
                          ),
                          //W! Title
                          Expanded(
                            child: Center(
                              child: model.selectedCollection.fold<Widget>(
                                () => 'msg_select_collection'.tr().asHeadline6(context),
                                (selectedCollection) =>
                                    (selectedCollection.name ?? 'Untitled Collection').asHeadline6(context),
                              ),
                            ),
                          ),
                          //W! Action Button
                          IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                              alignment: Alignment.centerRight,
                              onPressed: () => model.selectedCollection.fold(
                                    () {},
                                    (collection) => Navigator.pop(context, collection),
                                  ),
                              icon: Icon(CupertinoIcons.check_mark_circled,
                                  color: model.selectedCollection.fold(
                                    () => secondaryColor(context),
                                    (a) => IluramaColors.accentColor,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  //W! Search Bar
                  SizedBox(
                    height: searchBarHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CupertinoSearchTextField(
                        controller: searchTermController,
                        style: TextStyle(color: IluramaColors.primaryTextColor.from(context)),
                        autocorrect: false,
                        onChanged: model.onSearch,
                        onSubmitted: model.onSearch,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //W! Content
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 150)),
              if (model.isBusy)
                const SliverToBoxAdapter(child: Center(child: CupertinoActivityIndicator(radius: 30)))
              else
                SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 1.0,
                  children: model.displayableCollections.isEmpty
                      ? [
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                  child: Text(
                                'msg_no_collections'.tr(),
                                style: overline(context).copyWith(color: secondaryColor(context)),
                              )))
                        ]
                      : model.displayableCollections
                          .map(
                            (collection) => GestureDetector(
                              onTap: () => model.toggleSingleSelection(collection),
                              child: FutureBuilder<List<Color>>(
                                future: model.getColorsForCollection(collection),
                                builder: (context, AsyncSnapshot<List<Color>> snapshot) => CollectionBox(
                                  collection,
                                  collectionColors:
                                      (snapshot.data ?? [secondaryColor(context), baseColor(context)]).seamlessSweep,
                                  selected: model.selectedCollection.fold(
                                    () => false,
                                    (selectedCollection) => selectedCollection.id == collection.id,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
            ],
          );
        });
  }
}

class CollectionBox extends StatelessWidget {
  const CollectionBox(this.doc, {Key? key, required this.collectionColors, this.selected = false}) : super(key: key);

  final Collection doc;
  final List<Color> collectionColors;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: selected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: IluramaColors.accentColor),
              color: CupertinoColors.tertiarySystemFill,
            )
          : null,
      padding: selected ? const EdgeInsets.all(0) : const EdgeInsets.all(1.0),
      key: Key(doc.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(60, 60)),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: CollectionColorsRepresentation(
                  collectionColors,
                  boxSize: 60,
                  strokeWidth: 15,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
            child: Text(
              doc.name ?? 'Untitled Collection',
              style: subtitle1(context),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
