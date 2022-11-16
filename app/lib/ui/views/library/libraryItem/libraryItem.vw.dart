import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:star_menu/star_menu.dart';

import '../../../../app/extensions/extensions.dart';
import '../../../../app/routes/router.gr.dart';
import '../../../../entities/content_types/content_types.dart';
import '../../../../models/models.dart';
import '../../../components/components.dart';
import '../../../widgets/widgets.dart';
import '../../content/forms/single_collection_selector.vw.dart';
import '../../content/forms/single_product_selector.vw.dart';
import '../compareItem/compareItem.vw.dart';
import 'libraryItem.vm.dart';

class LibraryItemView extends StatelessWidget {
  final String libraryItemId;

  /// title of the previous route to be shown as the back button text in this route
  final String? parentRouteShortTitle;
  const LibraryItemView(this.libraryItemId, {Key? key, this.parentRouteShortTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> flashlightAnimator = ValueNotifier(false);
    return ViewModelBuilder<LibraryItemViewModel>.reactive(
      viewModelBuilder: () => LibraryItemViewModel(libraryItemId),
      builder: (context, model, child) {
        final colorItem = model.colorItem;
        final colorItemTitle = '${colorItem.itemCode}\n${colorItem.name}';
        final colorItemName = '${colorItem.itemCode} - ${colorItem.name}';

        return IluramaFrostedScaffold(
          opacityListener: model.fade,
          appBarForegroundAlwaysVisible: true,
          //W! AppBar
          customAppbarForeground: IluramaItemAppbar(
            fader: model.fader,
            title: colorItemTitle,
            parentRouteShortTitle: parentRouteShortTitle,
            starMenu: StarMenu(
              params: getStarMenuParameters(context),
              onItemTapped: (itemIndex, controller) {
                if (controller.closeMenu != null) controller.closeMenu!();
                model.menuItems.elementAt(itemIndex).action.when(
                      //= When add product to collection
                      addProductToCollection: () => CupertinoScaffold.showCupertinoModalBottomSheet<Collection>(
                        barrierColor: barrierModalColor(context),
                        context: context,
                        builder: (_) => const SingleCollectionSelectorView(),
                        useRootNavigator: true,
                      ).then((collection) => model.setNewContainingCollection(collection)).then(
                            (collectionName) => collectionName != null
                                ? showTopSnackBar(
                                    context,
                                    CustomSnackBar.success(
                                        message: 'msg_x_was_added_to_y'.tr(args: [colorItem.name, collectionName])))
                                : null,
                          ),
                      //= When set custom alternative
                      setCustomAlternative: () => CupertinoScaffold.showCupertinoModalBottomSheet<String?>(
                        barrierColor: barrierModalColor(context),
                        context: context,
                        builder: (_) => const SingleProductSelectorView(),
                        useRootNavigator: true,
                      ).then((matchingProductId) => model.setNewProductMatch(matchingProductId)).then(
                            (matchedProductId) => matchedProductId != null
                                ? showTopSnackBar(
                                    context,
                                    CustomSnackBar.success(
                                        message: 'msg_x_was_added_as_alternative_to_y'
                                            .tr(args: [matchedProductId, colorItem.name])),
                                  )
                                : null,
                          ),
                      //= When toggle flashlight
                      toggleFlashlight: () => context.router.push(Flashlight(color: colorItem.color)),
                      //= When compare with
                      compareWith: () => CupertinoScaffold.showCupertinoModalBottomSheet<String?>(
                        barrierColor: barrierModalColor(context),
                        context: context,
                        builder: (_) => const SingleProductSelectorView(),
                        useRootNavigator: true,
                      ).then(
                        (matchingProductId) {
                          final targetColorItem = model.getColorItemFromKey(matchingProductId);
                          if (targetColorItem == null) return;
                          CupertinoScaffold.showCupertinoModalBottomSheet<String?>(
                            barrierColor: barrierModalColor(context),
                            context: context,
                            builder: (_) => CompareItemView(source: colorItem, target: targetColorItem),
                            useRootNavigator: true,
                          );
                        },
                      ),
                    );
              },
              items: model.menuItems.getRows,
              child: const Icon(CupertinoIcons.ellipsis_circle, color: IluramaColors.accentColor),
            ),
          ),
          //W! Content
          slivers: [
            if (parentRouteShortTitle == null)
              const SliverPadding(padding: EdgeInsets.all(25))
            else
              const SliverPadding(padding: EdgeInsets.all(50.0)),
            SliverToBoxAdapter(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ItemInfoBlock(item: model.colorItem, brand: model.itemBrand),
                //W! Item Representation (color/image)
                SizedBox(
                  width: double.infinity,
                  height: 175,
                  child: GestureDetector(
                    onLongPressDown: (_) => flashlightAnimator.value = true,
                    onLongPressUp: () => flashlightAnimator.value = false,
                    onLongPressCancel: () => flashlightAnimator.value = false,
                    onLongPress: () => colorItem.color != Colors.white
                        ? context.router.push(Flashlight(color: colorItem.color))
                        : null,
                    child: ValueListenableBuilder<bool>(
                        valueListenable: flashlightAnimator,
                        builder: (context, value, widget) {
                          return AnimatedPadding(
                              padding: value ? const EdgeInsets.all(8) : const EdgeInsets.all(0),
                              curve: Curves.easeOutBack,
                              duration: const Duration(milliseconds: 400),
                              child: ItemRepresentationBlock(colorItem));
                        }),
                  ),
                ),
                const SizedBox(height: 15),
                //W! Item Data Toggle
                if (colorItem.type != const ColorItemType.diffusionFilter()) ItemDataBlock(colorItem),

                //W! Graph
                if (model.graphData.isSome() && model.graphStops.isSome())
                  Neumorphic(
                    style: const NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.rect(),
                      depth: 0,
                      color: CupertinoColors.quaternarySystemFill,
                    ),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GraphBlock(
                      graphData: model.graphData.fold(() => [], (a) => a),
                      graphStops: model.graphStops.fold(() => [], (a) => a),
                    ),
                  ),

                //W! Custom Matches
                model.userCustomMatches.getOrEmptyWidget((colorItems) => colorItems.isNotEmpty
                    ? CustomMatchColorsBlock(
                        colorItems,
                        parentItemName: colorItemName,
                      )
                    : const SizedBox()),
                //W! Related Collections
                model.relatedCollections.getOrEmptyWidget(
                  (relatedCollections) => relatedCollections.isNotEmpty
                      ? RelatedCollectionsBlock(
                          relatedCollections,
                          parentItemName: colorItemName,
                        )
                      : const SizedBox(),
                ),
                //W! Related Colors
                RelatedColorsBlock(
                  model.relatedColors,
                  parentItemName: colorItemName,
                ),
                //W! Available Formats
                model.availableFormats.getOrEmptyWidget((availableFormats) =>
                    availableFormats.isNotEmpty ? AvailableFormatsBlock(availableFormats) : const SizedBox()),

                //W! Related Posts
                model.relatedScenes.getOrEmptyWidget((relatedScenes) => RelatedScenesBlock(relatedScenes)),
                //W! Empty Space
                const SizedBox.square(dimension: 100)
              ],
            ))
          ],
        );
      },
    );
  }
}
