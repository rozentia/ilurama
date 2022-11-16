import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/action_sheet_frame.dart';
import '../../../widgets/glarehub_item.dart';
import '../../library/libraryFilterModal.vw.dart';
import 'product_selector.vm.dart';

class SingleProductSelectorView extends StatelessWidget {
  const SingleProductSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTermController = TextEditingController();
    return ViewModelBuilder<ProductSelectorViewModel>.reactive(
        viewModelBuilder: () => ProductSelectorViewModel(searchTermController),
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
                          //W! Close/Cancel Button
                          IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                              alignment: Alignment.centerLeft,
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(CupertinoIcons.xmark_circle, color: criticalColor(context))),
                          //W! Title
                          Expanded(
                              child: Center(
                                  child: model.singleProductSelected.fold<Widget>(
                                      () => 'msg_select_product'.tr().asHeadline6(context),
                                      (selectedProduct) =>
                                          '${selectedProduct.code} – ${selectedProduct.name}'.asHeadline6(context)))),
                          //W! Action (Select) Button
                          IconButton(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                              alignment: Alignment.centerRight,
                              onPressed: () => model.singleProductSelected.fold(
                                    () {},
                                    (product) => Navigator.pop(context, product.key),
                                  ),
                              icon: Icon(CupertinoIcons.check_mark_circled,
                                  color: model.singleProductSelected.fold(
                                    () => CupertinoColors.quaternarySystemFill,
                                    (a) => IluramaColors.accentColor,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  //W! Search Bar
                  SizedBox(
                    height: searchBarHeight,
                    child: Row(
                      children: [
                        Expanded(
                          // height: searchBarHeight,
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
                        //W! Filter Button
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
                ],
              ),
            ),
            //W! Content
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 150)),
              SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: model.displayableItems.isEmpty
                    ? [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                                child: Text(
                              'msg_no_items'.tr(),
                              style: overline(context).copyWith(color: secondaryColor(context)),
                            )))
                      ]
                    : model.displayableItems
                        .map(
                          (colorItem) => GestureDetector(
                            onTap: () => model.toggleSingleSelection(colorItem.key),
                            onLongPress: () => Navigator.pop(context, colorItem.key),
                            child: ColorItemBox(colorItem,
                                selected: model.singleProductSelected
                                    .fold<bool>(() => false, (item) => item.key == colorItem.key)),
                          ),
                        )
                        .toList(),
              ),
            ],
          );
        });
  }
}
