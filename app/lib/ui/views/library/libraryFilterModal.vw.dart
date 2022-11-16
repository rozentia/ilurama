import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama/entities/content_types/content_types.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import 'libraryFilterModal.vm.dart';

class LibraryFilterModal extends StatelessWidget {
  const LibraryFilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LibraryFilterModalViewModel>.reactive(
        viewModelBuilder: () => LibraryFilterModalViewModel(),
        builder: (context, model, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: 'title_sort_and_filter'.tr().asBodyText1(context),
                  )),
                  if (model.hasFilter)
                    IluramaTextButton(text: 'msg_clear_filters'.tr(), onPressed: model.clearFilterSettings),
                  IconButton(
                    onPressed: () => context.router.pop(),
                    icon: const Icon(CupertinoIcons.xmark_circle_fill),
                    color: secondaryColor(context),
                  )
                ],
              ),
              //= Color Range Filter
              const SizedBox(height: 20),
              'title_color_range'.tr().asSectionHeader,
              SizedBox(
                height: 30,
                child: ColorPickerSlider(TrackType.hue, model.currentColor, model.updateColorFilter),
              ),
              //= Brand Filter
              const SizedBox(height: 20),
              'title_brands'.tr().asSectionHeader,
              const SizedBox(height: 10),
              ToggleButtons(
                isSelected: model.selectedBrands,
                onPressed: model.selectBrand,
                fillColor: accentColor(context),
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                children: model.availableBrands
                    .map((brandName) => SizedBox(width: 120, child: Center(child: brandName.asSubtitle1(context))))
                    .toList(),
              ),
              //= Branch Filter
              // const SizedBox(height: 20),
              // 'Branches'.toUpperCase().asCaption(context),
              // Wrap(
              //   spacing: 5,
              //   children: model.availableBranches.fold<List<Widget>>(
              //       [],
              //       (prev, curr) => [
              //             ...prev,
              //             FilterChip(
              //               label: curr.asOverline(context),
              //               onSelected: (_) {},
              //             )
              //           ]),
              // ),
              //= Type Filter
              const SizedBox(height: 20),
              'title_type'.tr().asSectionHeader,
              const SizedBox(height: 10),
              ToggleButtons(
                isSelected: model.selectedTypes,
                onPressed: model.selectType,
                fillColor: accentColor(context),
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                children: model.availableTypes
                    .map((type) => SizedBox(
                        width: (MediaQuery.of(context).size.width - 45) / model.availableTypes.length,
                        child: Center(
                            child: Text(
                          type.typeLabel.replaceAll(' ', '\n'),
                          style: overline(context),
                          textAlign: TextAlign.center,
                        ))))
                    .toList(),
              ),
              const SizedBox(height: 40),
            ],
          );
        });
  }
}
