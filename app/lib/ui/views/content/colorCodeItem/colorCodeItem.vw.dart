import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:star_menu/star_menu.dart';

import '../../../../app/core/core.dart';
import '../../../../app/extensions/extensions.dart';
import '../../../../models/models.dart';
import '../../../components/components.dart';
import '../../../widgets/widgets.dart';
import '../../views.dart';
import 'colorCodeItem.vm.dart';

class ColorCodeItemView extends StatelessWidget {
  final String colorCodeId;

  /// title of the previous route to be shown as the back button text in this route
  final String? parentRouteShortTitle;
  const ColorCodeItemView(this.colorCodeId, {Key? key, this.parentRouteShortTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: ViewModelBuilder<ColorCodeItemViewModel>.reactive(
        viewModelBuilder: () => ColorCodeItemViewModel(colorCodeId),
        builder: (context, model, child) {
          final item = model.colorCodeItem;

          return IluramaFrostedScaffold(
            opacityListener: model.fade,
            appBarForegroundAlwaysVisible: true,
            customAppbarForeground: IluramaItemAppbar(
              fader: model.fader,
              title: item.name ?? 'text_item_has_no_name'.tr(),
              parentRouteShortTitle: parentRouteShortTitle,
              starMenu: StarMenu(
                params: getStarMenuParameters(context),
                onItemTapped: (itemIndex, controller) {
                  if (controller.closeMenu != null) controller.closeMenu!();
                  model.menuItems.elementAt(itemIndex).action.when(
                        //= When Add to Collection
                        addToCollection: () => CupertinoScaffold.showCupertinoModalBottomSheet<Collection?>(
                          context: context,
                          barrierColor: barrierModalColor(context),
                          useRootNavigator: true,
                          builder: (context) => const SingleCollectionSelectorView(),
                        ).then((result) => model.runBusyFuture(
                              model.addItemToCollection(result?.id),
                            )),
                        //= When Link to Product
                        linkToProduct: () => CupertinoScaffold.showCupertinoModalBottomSheet<String?>(
                          context: context,
                          barrierColor: barrierModalColor(context),
                          useRootNavigator: true,
                          builder: (context) => const SingleProductSelectorView(),
                          //FIXME ColorCodeRelation can store a relation description but it is now only storing the product key
                        ).then((productKey) => model.runBusyFuture(
                              model.linkProduct(ColorCodeRelation(productKey: productKey)),
                            )),
                        //= When Edit
                        editColorCode: () => CupertinoScaffold.showCupertinoModalBottomSheet<CRUDActions>(
                          context: context,
                          barrierColor: barrierModalColor(context),
                          useRootNavigator: true,
                          builder: (context) => ColorCodeFormView(colorCodeToEdit: item),
                        ).then((result) => result?.maybeWhen(
                              orElse: () {},
                              update: () => model.notifyListeners(),
                              delete: () => model.deleteColorCode().then((_) => Navigator.pop(context)),
                            )),
                        //= When Delete
                        deleteColorCode: () => showDialog<bool>(
                          context: context,
                          builder: (_) => AlertYesNo(
                            title: 'msg_title_delete_color_code'.tr(),
                            message: 'msg_confirmation_delete_color_code'.tr(),
                          ),
                        ).then((result) =>
                            result == true ? model.deleteColorCode().then((_) => Navigator.pop(context)) : null),
                      );
                },
                items: model.menuItems.getRows,
                child: const Icon(CupertinoIcons.ellipsis_circle, color: IluramaColors.accentColor),
              ),
            ),
            //W! Content
            slivers: [
              const SliverPadding(padding: EdgeInsets.all(58)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //W! Title
                      Text(
                        model.colorCodeItem.name ?? 'Unknown',
                        style: headline1(context),
                        textAlign: TextAlign.left,
                      ),
                      //W! Description (if some)
                      if (model.colorCodeItem.description?.isNotEmpty == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
                          child: Text(
                            model.colorCodeItem.description!,
                            style: subtitle1(context).copyWith(color: secondaryColor(context)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 500,
                          ),
                        ),
                      //W! Item Representation (color/image)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(height: 130, child: CodedColorRepresentationExpanded(item)),
                      ),
                      const SizedBox(height: 15),
                      //W! Color Code Item Data
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ColorCodeItemDataBlock(item),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  //W! Custom Linked Products
                  optionOf(item.relatedProducts).getOrEmptyWidget(
                    (relatedProducts) => relatedProducts.isNotEmpty
                        ? ColorCodeRelationsBlock(
                            relations: relatedProducts,
                            relatedColors: model.relatedColorItems,
                            parentItemName: item.name ?? 'title_color_code'.tr(),
                          )
                        : const SizedBox(),
                  ),
                  //W! Related Collections
                  if (model.collectionsWithThisColorCode.isNotEmpty)
                    RelatedCollectionsBlock(
                      model.collectionsWithThisColorCode,
                      parentItemName: item.name ?? 'title_color_code'.tr(),
                    ),

                  //W! Empty Space
                  const SizedBox.square(dimension: 100),
                ],
              ))
            ],
          );
        },
      ),
    );
  }
}
