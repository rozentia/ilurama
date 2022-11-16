import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:star_menu/star_menu.dart';

import '../../../../app/core/core.dart';
import '../../../../app/orphan_types.dart';
import '../../../../app/routes/routes.dart';
import '../../../components/components.dart';
import '../../../widgets/widgets.dart';
import '../forms/collection_form.vw.dart';
import '../forms/single_product_selector.vw.dart';
import 'collectionItem.vm.dart';

class CollectionItemView extends StatelessWidget {
  final String collectionId;

  /// optional title of the previous route to be shown as the back button text in this route
  final String? parentRouteShortTitle;

  const CollectionItemView(this.collectionId, {Key? key, this.parentRouteShortTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: ViewModelBuilder<CollectionItemViewModel>.reactive(
        viewModelBuilder: () => CollectionItemViewModel(collectionId),
        builder: (context, model, child) {
          final item = model.collection;
          final List<StarMenuItem<CollectionItemActions>> menuItems = [
            if (model.viewAsGrid)
              StarMenuItem(
                  'menu_items.view_as_list'.tr(), CupertinoIcons.rectangle_grid_1x2, const ToggleCollectionItemsView())
            else
              StarMenuItem(
                  'menu_items.view_as_grid'.tr(), CupertinoIcons.square_grid_2x2, const ToggleCollectionItemsView()),
            StarMenuItem(
                'menu_items.add_new_item'.tr(), CupertinoIcons.plus_square_on_square, const AddNewItemToCollection()),
            StarMenuItem('menu_items.create_scene'.tr(), CupertinoIcons.rectangle_stack_badge_plus,
                const NewSceneFromCollection()),
            StarMenuItem('menu_items.edit'.tr(), CupertinoIcons.pencil_ellipsis_rectangle, const EditCollection()),
            StarMenuItem('menu_items.delete'.tr(), CupertinoIcons.trash, const DeleteCollection()),
          ];

          return IluramaFrostedScaffold(
            opacityListener: model.fade,
            appBarForegroundAlwaysVisible: true,
            //W! AppBar
            customAppbarForeground: IluramaItemAppbar(
              fader: model.fader,
              title: model.title,
              parentRouteShortTitle: parentRouteShortTitle,
              starMenu: StarMenu(
                params: getStarMenuParameters(context),
                onItemTapped: (itemIndex, controller) {
                  if (controller.closeMenu != null) controller.closeMenu!();
                  menuItems.elementAt(itemIndex).action.when(
                        //= When toggle view
                        toggleItemsView: () => model.toggleView(),
                        //= When Add new Item
                        addNewItem: () => CupertinoScaffold.showCupertinoModalBottomSheet<String?>(
                          barrierColor: barrierModalColor(context),
                          context: context,
                          builder: (_) => const SingleProductSelectorView(),
                          useRootNavigator: true,
                        ).then((maybeItemKey) => model.addItemToCollection(maybeItemKey)).then(
                              (maybeItemKey) => maybeItemKey != null
                                  ? showTopSnackBar(
                                      context,
                                      CustomSnackBar.success(
                                        message: 'msg_x_was_added_to_y'.tr(args: [
                                          maybeItemKey,
                                          item.name ?? 'text_item_has_no_name'.tr(),
                                        ]),
                                      ))
                                  : null,
                            ),

                        //FFEATURE When Add new Scene
                        newSceneFromCollection: () => throw UnimplementedError(),
                        //= When edit collection
                        editCollection: () => CupertinoScaffold.showCupertinoModalBottomSheet<CRUDActions>(
                          barrierColor: barrierModalColor(context),
                          useRootNavigator: true,
                          context: context,
                          builder: (_) => CollectionFormView(collectionToEdit: item),
                        ).then((result) => result?.maybeWhen(orElse: () {}, delete: () => Navigator.pop(context))),
                        //= When delete collection
                        deleteCollection: () => showDialog<bool>(
                          context: context,
                          builder: (_) => AlertYesNo(
                            title: 'msg_delete_collection'.tr(),
                            message: 'msg_delete_collection_confirm'.tr(),
                          ),
                        )
                            .then((result) => result != null
                                ? result
                                    ? model.deleteCollection().then((result) =>
                                        result ? Navigator.pop<CRUDActions>(context, const CRUDActions.delete()) : null)
                                    : null
                                : null)
                            .then((value) => null),
                      );
                },
                items: menuItems.getRows,
                child: const Icon(CupertinoIcons.ellipsis_circle, color: IluramaColors.accentColor),
              ),
            ),
            //W! Content
            slivers: [
              const SliverPadding(padding: EdgeInsets.all(55)),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //W! Title
                    Text(
                      model.title,
                      style: headline1(context),
                      textAlign: TextAlign.left,
                    ),
                    //W! Description (if some)
                    if (model.description.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
                        child: Text(
                          model.description,
                          style: subtitle1(context).copyWith(color: secondaryColor(context)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 500,
                        ),
                      )
                  ],
                ),
              )),
              SliverPadding(
                padding: const EdgeInsets.only(top: 20, bottom: 100),
                sliver: model.viewAsGrid
                    //W! Grid View
                    ? SliverGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: model.collectionItems.isEmpty
                            ? [
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                        child: Text(
                                      'msg_no_items_please_add'.tr(),
                                      style: overline(context).copyWith(color: secondaryColor(context)),
                                    )))
                              ]
                            : model.collectionItems
                                .map(
                                  (colorItem) => GestureDetector(
                                    onTap: () => context.router.push(
                                      colorItem.item.fold(
                                        (product) => LibraryItemRoute(
                                          libraryItemId: product.key,
                                          parentRouteShortTitle: item.name ?? 'label_collection'.tr(),
                                        ),
                                        (colorCode) => ColorCodeItemRoute(
                                          colorCodeId: colorCode.id,
                                          parentRouteShortTitle: item.name ?? 'label_collection'.tr(),
                                        ),
                                      ),
                                    ),
                                    child: ColorItemBox(colorItem),
                                    // onLongPress: () {
                                    // FFEATURE: remove item from collection upon long press
                                    // },
                                  ),
                                )
                                .toList(),
                      )
                    //W! List View
                    : SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          model.collectionItems.isEmpty
                              ? [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                          child: Text(
                                        'msg_no_items_please_add'.tr(),
                                        style: overline(context).copyWith(color: secondaryColor(context)),
                                      )))
                                ]
                              : model.collectionItems
                                  .map(
                                    (colorItem) => IluramaTableRow(
                                      key: Key('${colorItem.name}-${colorItem.key}@${item.name}'),
                                      onTap: () => context.router.push(
                                        colorItem.item.fold(
                                          (product) => LibraryItemRoute(
                                            libraryItemId: product.key,
                                            parentRouteShortTitle: item.name ?? 'label_collection'.tr(),
                                          ),
                                          (colorCode) => ColorCodeItemRoute(
                                            colorCodeId: colorCode.id,
                                            parentRouteShortTitle: item.name ?? 'label_collection'.tr(),
                                          ),
                                        ),
                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: SizedBox.square(
                                          dimension: 61,
                                          child: colorItem.item.fold(
                                              (product) => colorItem.type.when<Widget>(
                                                    colorFilter: () => ColorFilterRepresentation(
                                                      colorItem.color,
                                                      colorItem.itemCode,
                                                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                                                    ),
                                                    diffusionFilter: () => Padding(
                                                      padding: const EdgeInsets.all(2.0),
                                                      child: DiffuseFilterRepresentation(
                                                        colorItem.color,
                                                        colorItem.itemCode,
                                                        colorItem.imageFileName,
                                                      ),
                                                    ),
                                                    glassFilter: () =>
                                                        GlassFilterRepresentation(colorItem.color, colorItem.itemCode),
                                                    technicalFilter: () => TechnicalFilterRepresentation(
                                                        colorItem.color, colorItem.itemCode),
                                                  ),
                                              (colorCode) => Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: CodedColorRepresentation(colorCode.safeColor),
                                                  )),
                                        ),
                                      ),
                                      title: colorItem.name,
                                      subtitleText: colorItem.description.fold(() => '...', (d) => d),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
