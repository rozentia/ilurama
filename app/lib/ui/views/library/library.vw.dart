import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../../app/routes/routes.dart';
import '../../../models/models.dart';
import '../../components/components.dart';
import '../../widgets/action_sheet_frame.dart';
import '../../widgets/glarehub_item.dart';
import '../../widgets/star_menu_item.dart';
import '../content/forms/single_collection_selector.vw.dart';
import '../content/forms/single_product_selector.vw.dart';
import 'compareItem/compareItem.vw.dart';
import 'library.vm.dart';
import 'libraryFilterModal.vw.dart';
import 'libraryItem/libraryItem.vm.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTermController = TextEditingController();
    return ViewModelBuilder<LibraryViewModel>.reactive(
      builder: (context, model, child) {
        const searchBarHeight = 35.0;
        return IluramaFrostedScaffold(
          appBarAlwaysVisible: true,
          appBarForegroundAlwaysVisible: true,
          appbarHeight: searchBarHeight + 20,
          customAppbarForeground: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    //W! Search Bar
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CupertinoSearchTextField(
                          controller: searchTermController,
                          autocorrect: false,
                          style: TextStyle(color: IluramaColors.primaryTextColor.from(context)),
                          onChanged: model.onSearch,
                          onSubmitted: model.onSearch,
                        ),
                      ),
                    ),
                    //W! Action Buttons
                    IconButton(
                      icon: model.hasFilters
                          ? const Icon(
                              CupertinoIcons.line_horizontal_3_decrease_circle_fill,
                              color: Colors.orange,
                            )
                          : const Icon(CupertinoIcons.line_horizontal_3_decrease_circle),
                      onPressed: () => showBarModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        builder: (context) => const ActionSheetFrame(child: LibraryFilterModal()),
                      ),
                    ),
                    const SizedBox(width: 5)
                    // FFEATURE Feature: multi color comparison view
                    // IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.square_line_vertical_square_fill))
                  ],
                ),
              ],
            ),
          ),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 150)),
            SliverGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: [
                if (model.displayableItems.isEmpty)
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        'msg_no_items'.tr(),
                        style: overline(context).copyWith(color: secondaryColor(context)),
                      )))
                else
                  //W! Content
                  ...model.displayableItems.map(
                    (colorItem) => CupertinoContextMenu(
                      actions: model
                          .menuItemsFor(colorItem)
                          .asMap()
                          .map<int, Widget>((key, starMenuItem) {
                            return MapEntry(
                              key,
                              ViewModelBuilder<LibraryItemViewModel>.reactive(
                                  viewModelBuilder: () => LibraryItemViewModel(colorItem.key),
                                  builder: (context, itemModel, widget) {
                                    return GestureDetector(
                                      onTap: starMenuItem.action.when<VoidCallback>(
                                        //= When Add product to Collection
                                        addProductToCollection: () => () => showCupertinoModalBottomSheet<Collection>(
                                              barrierColor: barrierModalColor(context),
                                              context: context,
                                              builder: (_) => const SingleCollectionSelectorView(),
                                              useRootNavigator: true,
                                            )
                                                .then((collection) => itemModel.setNewContainingCollection(collection))
                                                .then(
                                                  (collectionName) => collectionName != null
                                                      ? showTopSnackBar(
                                                          context,
                                                          CustomSnackBar.success(
                                                            message: 'msg_x_was_added_to_y'
                                                                .tr(args: [colorItem.name, collectionName]),
                                                          ))
                                                      : null,
                                                ),
                                        //= When set custom alternative
                                        setCustomAlternative: () => () => showCupertinoModalBottomSheet<String?>(
                                              barrierColor: barrierModalColor(context),
                                              context: context,
                                              builder: (_) => const SingleProductSelectorView(),
                                              useRootNavigator: true,
                                            )
                                                .then((matchingProductId) =>
                                                    itemModel.setNewProductMatch(matchingProductId))
                                                .then(
                                                  (matchedProductId) => matchedProductId != null
                                                      ? showTopSnackBar(
                                                          context,
                                                          CustomSnackBar.success(
                                                            message: 'msg_x_was_added_as_alternative_to_y'
                                                                .tr(args: [matchedProductId, colorItem.name]),
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                        //= When Toggle flashlight
                                        toggleFlashlight: () =>
                                            () => context.router.push(Flashlight(color: colorItem.color)),
                                        //= When compare with...
                                        compareWith: () => () => showCupertinoModalBottomSheet<String?>(
                                              barrierColor: barrierModalColor(context),
                                              context: context,
                                              builder: (_) => const SingleProductSelectorView(),
                                              useRootNavigator: true,
                                            ).then(
                                              (matchingProductId) {
                                                final targetColorItem =
                                                    itemModel.getColorItemFromKey(matchingProductId);
                                                if (targetColorItem == null) return;
                                                showCupertinoModalBottomSheet<String?>(
                                                  barrierColor: barrierModalColor(context),
                                                  context: context,
                                                  builder: (_) =>
                                                      CompareItemView(source: colorItem, target: targetColorItem),
                                                  useRootNavigator: true,
                                                );
                                              },
                                            ),
                                      ),
                                      child: StarMenuItemRow(
                                        starMenuItem,
                                        itemIndex: key,
                                        itemsLength: model.menuItemsFor(colorItem).length,
                                        backgroundOpacityDark: 0.8,
                                      ),
                                    );
                                  }),
                            );
                          })
                          .values
                          .toList(),
                      //W! Content Item
                      child: GestureDetector(
                        onTap: () => context.router.push(
                          LibraryItemRoute(
                            libraryItemId: colorItem.key,
                            parentRouteShortTitle: 'tab_title_library'.tr(),
                          ),
                        ),
                        child: ColorItemBox(colorItem),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
      viewModelBuilder: () => LibraryViewModel(searchTermController),
    );
  }
}
