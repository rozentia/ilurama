import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../../../entities/color_item/color_item.dart';
import '../../../components/components.dart';
import '../../content/forms/single_product_selector.vw.dart';
import 'compareItem.vm.dart';

class CompareItemView extends StatelessWidget {
  final ColorItem source;
  final ColorItem target;
  const CompareItemView({Key? key, required this.source, required this.target}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompareItemViewModel>.reactive(
        viewModelBuilder: () => CompareItemViewModel(source, target),
        builder: (context, model, child) {
          return IluramaFrostedScaffold(
            opacityListener: model.fade,
            appBarForegroundAlwaysVisible: true,
            customAppbarForeground: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //= Close Button
                Flexible(
                  child: IconButton(
                    onPressed: () => context.router.pop(),
                    icon: const Icon(CupertinoIcons.xmark_circle_fill),
                    color: secondaryColor(context),
                  ),
                ),
                //= Title
                Expanded(
                  flex: 2,
                  child: ValueListenableBuilder<double>(
                      valueListenable: model.fader,
                      builder: (context, value, widget) {
                        return Opacity(
                          opacity: value,
                          child: Column(
                            children: [
                              const SizedBox(width: double.infinity, height: 5),
                              source.itemCode.asHeadline5(context),
                              Text(
                                source.name,
                                overflow: TextOverflow.ellipsis,
                                style: subtitle1(context).copyWith(color: secondaryColor(context)),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: ValueListenableBuilder<double>(
                      valueListenable: model.fader,
                      builder: (context, value, widget) {
                        return Opacity(
                          opacity: value,
                          child: Column(
                            children: [
                              const SizedBox(width: double.infinity, height: 5),
                              model.target.itemCode.asHeadline5(context),
                              Text(
                                model.target.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: subtitle1(context).copyWith(color: secondaryColor(context)),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                //= Action buttons
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: accentColor(context),
                        icon: const Icon(CupertinoIcons.arrow_2_squarepath),
                        onPressed: () => showCupertinoModalBottomSheet<String?>(
                          barrierColor: barrierModalColor(context),
                          context: context,
                          builder: (_) => const SingleProductSelectorView(),
                          useRootNavigator: true,
                        ).then((matchingProductId) {
                          final targetColorItem = model.getColorItemFromKey(matchingProductId);
                          if (targetColorItem == null) return;
                          model.updateTarget(targetColorItem);
                        }),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ],
            ),
            //= Content
            slivers: [
              const SliverPadding(padding: EdgeInsets.all(25)),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //= Title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: ItemInfoBlock(item: source, brand: const None())),
                        Expanded(child: ItemInfoBlock(item: model.target, brand: const None())),
                      ],
                    ),
                    //= Color Representation
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    color: source.color),
                              ),
                            ),
                            Container(
                              width: 10,
                              color: source.color.mix(model.target.color),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: model.target.color),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //= Transmision Data
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: source.item.fold(
                            (product) => product.transmission != null
                                ? TransmissionColumnCompact(product.transmission!)
                                : const SizedBox(),
                            (r) => const SizedBox(),
                          ),
                        ),
                        Expanded(
                          child: model.target.item.fold(
                            (product) => product.transmission != null
                                ? TransmissionColumnCompact(product.transmission!)
                                : const SizedBox(),
                            (r) => const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                    //= Graph
                    GraphBlockComparing(
                      graphData: model.sourceGraphData.fold(() => [], (a) => a),
                      graphStops: model.sourceGraphStops.fold(() => [], (a) => a),
                      sourceColor: source.color,
                      targetColor: model.target.color,
                      targetGraphData: model.targetGraphData.fold(() => [], (a) => a),
                      targetGraphStops: model.targetGraphStops.fold(() => [], (a) => a),
                    )
                  ],
                ),
              ),
              const SliverPadding(padding: EdgeInsets.all(50))
            ],
          );
        });
  }
}
