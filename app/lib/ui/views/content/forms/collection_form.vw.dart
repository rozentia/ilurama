import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama/app/core/core.dart';
import 'package:ilurama/entities/color_item/color_item.dart';
import 'package:ilurama/models/models.dart';
import 'package:ilurama/ui/widgets/widgets.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../../components/components.dart';
import '../../library/libraryFilterModal.vw.dart';
import '../../library/libraryItem/libraryItem.vw.dart';
import 'collection_form.vm.dart';

class CollectionFormView extends StatelessWidget {
  final Collection? collectionToEdit;
  const CollectionFormView({Key? key, this.collectionToEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: collectionToEdit?.name);
    final TextEditingController descriptionController = TextEditingController(text: collectionToEdit?.description);
    return ViewModelBuilder<CollectionFormViewModel>.reactive(
      viewModelBuilder: () => CollectionFormViewModel(collectionToEdit: collectionToEdit),
      builder: (context, model, widget) => Stack(
        children: [
          IluramaFrostedScaffold(
            appBarForegroundAlwaysVisible: true,
            appBarTitle: collectionToEdit != null ? 'msg_edit_collection'.tr() : 'msg_new_collection'.tr(),
            appBarLeading: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                alignment: Alignment.centerLeft,
                onPressed: () => Navigator.pop(context),
                icon: Icon(CupertinoIcons.xmark_circle, color: criticalColor(context))),
            appBarActions: [
              IluramaButton(
                  onPressed: () => model.onSubmit().then((response) {
                        if (response) {
                          Navigator.pop(context);
                          return;
                        }
                        if (model.hasErrorForKey(model.unknownErrorKey)) {
                          showDialog(
                              context: context,
                              builder: (_) => AlertOkOnly(
                                    title: 'title_unknown_error'.tr(),
                                    message: 'msg_unknown_error_try_again'.tr(),
                                  ));
                          return;
                        }
                      }),
                  text: collectionToEdit != null ? 'msg_update'.tr() : 'msg_create'.tr())
            ],
            slivers: [
              const SliverPadding(padding: EdgeInsets.all(30)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputLabel('title_item_title'.tr()),
                      CupertinoTextField(
                        controller: nameController,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: BoxDecoration(
                          color: CupertinoColors.tertiarySystemFill,
                          borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                          border: Border.all(color: backgroundColor(context).lighten(5)),
                        ),
                        style: bodyText1(context),
                        onChanged: model.onChangeName,
                      ),
                      if (model.hasErrorForKey(model.validationErrorKey) && !model.titleValid)
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: Text(
                              'msg_collection_must_have_title'.tr(),
                              style: bodyText2(context).copyWith(color: IluramaColors.critical.from(context)),
                            ))
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputLabel('title_description'.tr()),
                      CupertinoTextField(
                        controller: descriptionController,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: BoxDecoration(
                          color: CupertinoColors.tertiarySystemFill,
                          borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                          border: Border.all(color: backgroundColor(context).lighten(5)),
                        ),
                        style: bodyText1(context),
                        maxLines: 5,
                        onChanged: model.onChangeDescription,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputLabel('title_products'.tr(args: [model.selectedProducts.toString()])),
                          if (model.hasErrorForKey(model.validationErrorKey) && !model.productsValid)
                            Text(
                              'msg_collection_must_have_products'.tr(),
                              style: bodyText2(context).copyWith(color: IluramaColors.critical.from(context)),
                            )
                        ],
                      ))),
              if (model.collectionProducts.isEmpty)
                SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                        child: Text(
                          'msg_please_tap_to_add_to_collection'.tr(),
                          style: bodyText1(context)
                              .copyWith(fontWeight: FontWeight.w200, color: IluramaColors.warning.from(context)),
                        )))
              else
                SliverPadding(
                  padding: const EdgeInsets.all(15),
                  sliver: SliverGrid.count(
                      crossAxisCount: 6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: model.collectionProducts
                          .map<Widget>((product) => GestureDetector(
                                onTap: () => model.onToggleProduct(product.key),
                                onLongPress: () => showCupertinoModalBottomSheet(
                                  barrierColor: barrierModalColor(context),
                                  context: context,
                                  builder: (_) => LibraryItemView(product.key),
                                  useRootNavigator: true,
                                ),
                                child: ColorItemThumbnail(
                                  ColorItem.fromProduct(product),
                                  badgeIcon: CupertinoIcons.xmark_circle_fill,
                                  padding: const EdgeInsets.all(3),
                                ),
                              ))
                          .toList()),
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        // height: searchBarHeight,
                        child: CupertinoSearchTextField(
                          autocorrect: false,
                          onChanged: model.onSearch,
                          onSubmitted: model.onSearch,
                          style: TextStyle(color: IluramaColors.primaryTextColor.from(context)),
                        ),
                      ),
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
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: model.displayableItems.isEmpty
                      ? [
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                  child: Text(
                                'msg_no_products_found'.tr(),
                                style: overline(context).copyWith(color: secondaryColor(context)),
                              )))
                        ]
                      : model.displayableItems
                          .map(
                            (colorItem) => GestureDetector(
                              onTap: () => model.onToggleProduct(colorItem.key),
                              child: ColorItemBox(colorItem, selected: model.isProductSelected(colorItem.key)),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
          if (collectionToEdit != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 120,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const FrostedRect(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: CupertinoButton(
                        color: ColorPalette.fireEngineRed,
                        onPressed: () => showDialog<bool>(
                            context: context,
                            builder: (_) => AlertYesNo(
                                  title: 'msg_delete_collection'.tr(),
                                  message: 'msg_delete_collection_confirm'.tr(),
                                )).then((result) => result != null
                            ? result
                                ? model.deleteCollection().then((result) =>
                                    result ? Navigator.pop<CRUDActions>(context, const CRUDActions.delete()) : null)
                                : null
                            : null),
                        child: 'msg_delete_collection'.tr().asButton(context),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ColorItemThumbnail extends StatelessWidget {
  final ColorItem item;

  /// If null no badgeIcon will be shown
  final IconData? badgeIcon;
  final Color? badgeIconColor;
  final Color badgeIconBackgroundColor;
  final AlignmentGeometry badgeIconAlignment;
  final double badgeIconSize;
  final bool hideCode;
  final EdgeInsets padding;

  const ColorItemThumbnail(this.item,
      {Key? key,
      this.badgeIcon,
      this.badgeIconColor,
      this.badgeIconBackgroundColor = IluramaColors.overCritical,
      this.badgeIconAlignment = Alignment.topLeft,
      this.badgeIconSize = 24,
      this.hideCode = false,
      this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Padding(
        padding: padding,
        child: item.type.when<Widget>(
          colorFilter: () => ColorFilterRepresentation(item.color, item.itemCode, hideCode: hideCode),
          diffusionFilter: () =>
              DiffuseFilterRepresentation(item.color, item.itemCode, item.imageFileName, hideCode: hideCode, size: 40),
          technicalFilter: () => TechnicalFilterRepresentation(item.color, item.itemCode, hideCode: hideCode, size: 40),
          glassFilter: () => GlassFilterRepresentation(item.color, item.itemCode, hideCode: hideCode, size: 40),
        ),
      ),
      if (badgeIcon != null)
        Align(
            alignment: badgeIconAlignment,
            child: Container(
              decoration: BoxDecoration(
                color: badgeIconBackgroundColor,
                borderRadius: BorderRadius.circular(50),
              ),
              width: badgeIconSize,
              height: badgeIconSize,
            )),
      if (badgeIcon != null)
        Align(
            alignment: badgeIconAlignment,
            child: Icon(badgeIcon, size: badgeIconSize, color: IluramaColors.critical.from(context))),
    ]);
  }
}
