import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../models/models.dart';
import 'color_code_parameter_label.dart';

class ColorCodeItemDataBlock extends StatelessWidget {
  final ColorCode item;
  const ColorCodeItemDataBlock(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelStyle = caption(context).copyWith(color: secondaryColor(context));
    final dataStyle = bodyText2(context);
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: CupertinoColors.systemFill,
          ),
          padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text('title_colorcode_parameters.parameters'.tr().toUpperCase(), style: labelStyle),
                  )),
              Expanded(flex: 2, child: Text('PERCENT', style: labelStyle)),
              Expanded(flex: 2, child: Text('COARSE', style: labelStyle)),
              Expanded(flex: 2, child: Text('FINE', style: labelStyle)),
            ],
          ),
        ),
        const SizedBox(height: 1.5),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: CupertinoColors.quaternarySystemFill),
          child: Column(
            children: item.parameters?.isNotEmpty != true
                ? []
                : item.parameters!
                    .asMap()
                    .map<int, Widget>(
                      (index, parameter) => MapEntry(
                          index,
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: index == item.parameters!.length - 1
                                        ? BorderSide.none
                                        : BorderSide(width: 1.5, color: IluramaColors.canvasColor.from(context)))),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: ColorCodeParameterLabel(parameter.parameterType ?? const ParameterWhite())),
                                Expanded(flex: 2, child: Text(parameter.percentValue.toString(), style: dataStyle)),
                                Expanded(
                                    flex: 2, child: Text(parameter.dmxCoarse?.toString() ?? '0', style: dataStyle)),
                                Expanded(flex: 2, child: Text(parameter.dmxFine?.toString() ?? '—', style: dataStyle)),
                              ],
                            ),
                          )),
                    )
                    .values
                    .toList(),
          ),
        ),
      ],
    );
  }
}
