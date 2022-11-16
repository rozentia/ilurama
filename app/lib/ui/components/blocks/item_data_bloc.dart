import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../entities/color_item/color_item.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';
import 'color_info_block.dart';
import 'transmission_column.dart';

class ItemDataBlock extends StatelessWidget {
  final ColorItem item;
  const ItemDataBlock(this.item, {Key? key}) : super(key: key);

  Option<Color> get color => optionOf(item.color.alpha != 0 ? item.color : null);
  Option<List<TransmissionData>> get transmissionData =>
      optionOf(item.item.fold((product) => product.transmission, (_) => null));

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selection = ValueNotifier<int>(0);
    final PageController controller = PageController(initialPage: 0);

    return ValueListenableBuilder<int>(
        valueListenable: selection,
        builder: (context, value, widget) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NeumorphicToggle(
                  style: NeumorphicToggleStyle(
                      lightSource: LightSource.top,
                      border: NeumorphicBorder(color: secondaryColor(context).withOpacity(0.1), width: 0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  height: 30,
                  selectedIndex: value,
                  onChanged: (newIndex) {
                    if (selection.value != newIndex) selection.value = newIndex;
                    if (controller.hasClients) {
                      controller.animateToPage(newIndex,
                          duration: const Duration(milliseconds: 200), curve: Curves.linear);
                    }
                  },
                  children: {
                    'Transmission': CupertinoIcons.alarm,
                    'Color': CupertinoIcons.cursor_rays,
                  }
                      .map(
                        (label, icon) => MapEntry(
                          label,
                          ToggleElement(
                            background: ToggleElementBlock(label,
                                style: subtitle1(context).copyWith(fontWeight: FontWeight.w400)),
                            foreground: ToggleElementBlock(label,
                                style: subtitle1(context).copyWith(fontWeight: FontWeight.w600)),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                  thumb: context.brightness == Brightness.dark
                      ? Container(color: secondaryColor(context).withOpacity(0.1))
                      : const SizedBox(),
                ),
                SizedBox(
                    height: 120,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (pageIndex) {
                        if (pageIndex != value) selection.value = pageIndex;
                      },
                      children: [
                        //= Transmission Page
                        transmissionData.getOrEmptyWidget(
                          (tData) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: tData.map((data) => Expanded(child: TransmissionColumn(data))).toList(),
                          ),
                        ),
                        //= Color Info Page
                        color.getOrEmptyWidget((c) => Center(child: ColorInfoBlock(itemColor: c))),
                      ].map((e) => Padding(padding: const EdgeInsets.only(top: 15), child: e)).toList(),
                    ))
              ],
            ),
          );
        });
  }
}
