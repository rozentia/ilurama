import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../../models/models.dart';
import '../../../components/components.dart';
import 'color_code_form.vm.dart';

class ParameterRow extends StatelessWidget {
  final ValueNotifier<ColorCodeParameterInterface> parameterInterfaceListenable;
  final ValueNotifier<List<ColorCodeParameterType>> unusedParameterTypesNotifier;
  final InputMode inputMode;

  /// Called when user deletes this parameter...
  /// must notify listeners of parameter list to update [unusedParameters]
  final VoidCallback onDelete;

  const ParameterRow({
    required this.parameterInterfaceListenable,
    required this.unusedParameterTypesNotifier,
    required this.onDelete,
    required this.inputMode,
    Key? key,
  }) : super(key: key);

  ColorCodeParameter get parameter => parameterInterfaceListenable.value.parameter;

  @override
  Widget build(BuildContext context) {
    final percentageController = TextEditingController(text: parameter.percentValue.toString());
    final coarseValueController = TextEditingController(text: parameter.dmxCoarse.toString());
    final fineValueController = TextEditingController(text: parameter.dmxFine?.toString() ?? '0');

    final FocusNode percentageFocusNode = FocusNode();
    final FocusNode coarseFocusNode = FocusNode();
    final FocusNode fineFocusNode = FocusNode();

    bool percentageError = false;
    bool coarseError = false;
    bool fineError = false;

    bool formHasError() => percentageError || coarseError || fineError;

    void reportError() {
      parameterInterfaceListenable.value = parameterInterfaceListenable.value.copyWithError(formHasError());
    }

    final platterColor = secondaryColor(context).withOpacity(context.brightness == Brightness.dark ? 0.1 : 0.1);

    return ValueListenableBuilder<ColorCodeParameterInterface>(
        valueListenable: parameterInterfaceListenable,
        builder: (context, parameterInterface, widget) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: platterColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      //W! Dropdown Button
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: platterColor),
                          child: ValueListenableBuilder<List<ColorCodeParameterType>>(
                              valueListenable: unusedParameterTypesNotifier,
                              builder: (context, unusedParameterTypes, widget) {
                                return DropdownButton<ColorCodeParameterType>(
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  dropdownColor: context.isLight
                                      ? Colors.white
                                      : IluramaColors.barrierModalColor.from(context).withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8),
                                  icon: const Icon(CupertinoIcons.chevron_down),
                                  iconSize: 14,
                                  items: ColorCodeParameterType.allTypesAvailable
                                      .map(
                                        (availableParameterType) => DropdownMenuItem(
                                          value: availableParameterType,
                                          enabled: unusedParameterTypes.contains(availableParameterType),
                                          child: ColorCodeParameterLabel(
                                            availableParameterType,
                                            disabled: !unusedParameterTypes.contains(availableParameterType),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  selectedItemBuilder: (context) => ColorCodeParameterType.allTypesAvailable
                                      .map(
                                        (availableParameterType) => ColorCodeParameterLabel(availableParameterType),
                                      )
                                      .toList(),
                                  value: parameterInterface.parameter.parameterType,
                                  onChanged: (selectedParameterType) {
                                    if (selectedParameterType == null) return;
                                    parameterInterfaceListenable.value =
                                        parameterInterfaceListenable.value.copyWithType(selectedParameterType);
                                  },
                                );
                              }),
                        ),
                      ),
                      //W! Bit Toggle
                      GestureDetector(
                        onTap: () => parameterInterfaceListenable.value = ColorCodeParameterInterface(
                          parameter.is8bit ? parameter.to16bit : parameter.to8bit,
                          error: parameterInterfaceListenable.value.error,
                        ),
                        child: SizedBox.square(
                          dimension: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: IluramaColors.accentColor,
                                  ),
                                  child: Text(
                                    parameter.is8bit ? '8' : '16',
                                    textAlign: TextAlign.center,
                                    style: bodyText2(context)
                                        .copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Text(
                                'BIT',
                                textAlign: TextAlign.center,
                                style: subtitle2(context).copyWith(
                                    color: IluramaColors.accentColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5),
                              )
                            ],
                          ),
                        ),
                      ),
                      //W! Text Editing Area
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                          child: inputMode == InputMode.percent
                              //W! Percent Text Field
                              ? TextField(
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    suffixText: '%',
                                  ),
                                  focusNode: percentageFocusNode,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  textAlign: TextAlign.center,
                                  style: headline4(context)
                                      .copyWith(color: percentageError ? IluramaColors.critical.from(context) : null),
                                  controller: percentageController,
                                  onTapOutside: (_) => percentageFocusNode.unfocus(),
                                  onChanged: (newValue) {
                                    final double parsedPercentage = double.tryParse(newValue) ?? 0.0;
                                    percentageError = parsedPercentage > 100.0;
                                    if (percentageError) {
                                      reportError();
                                      return;
                                    } else {
                                      parameterInterfaceListenable.value = parameterInterface.copyWithParameter(
                                        parameter.copyWithPercent(parsedPercentage),
                                        withError: formHasError(),
                                      );
                                    }
                                  },
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    //W! Coarse Text Field
                                    Expanded(
                                      child: TextField(
                                        keyboardType: const TextInputType.numberWithOptions(decimal: false),
                                        decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(0),
                                            border: InputBorder.none,
                                            isDense: true,
                                            labelText: 'COARSE',
                                            labelStyle: TextStyle(fontSize: 10)),
                                        focusNode: coarseFocusNode,
                                        style: headline4(context).copyWith(
                                          fontSize: 20,
                                          color: coarseError ? IluramaColors.critical.from(context) : null,
                                        ),
                                        controller: coarseValueController,
                                        onTapOutside: (_) => coarseFocusNode.unfocus(),
                                        onChanged: (newValue) {
                                          final parsedValue = int.tryParse(newValue) ?? 0;
                                          coarseError = parsedValue > 255;
                                          if (coarseError) {
                                            reportError();
                                            return;
                                          } else {
                                            parameterInterfaceListenable.value = parameterInterface.copyWithParameter(
                                              parameter..dmxCoarse = parsedValue,
                                              withError: formHasError(),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    //W! Fine Text Field
                                    if (!parameterInterface.parameter.is8bit)
                                      Expanded(
                                        child: TextField(
                                          keyboardType: const TextInputType.numberWithOptions(decimal: false),
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(0),
                                              border: InputBorder.none,
                                              isDense: true,
                                              labelText: 'FINE',
                                              labelStyle: TextStyle(fontSize: 10)),
                                          style: headline4(context).copyWith(
                                            fontSize: 20,
                                            color: fineError ? IluramaColors.critical.from(context) : null,
                                          ),
                                          focusNode: fineFocusNode,
                                          onTapOutside: (_) => fineFocusNode.unfocus(),
                                          controller: fineValueController,
                                          onChanged: (newValue) {
                                            final parsedValue = int.tryParse(newValue) ?? 0;
                                            fineError = parsedValue > 255;
                                            if (fineError) {
                                              reportError();
                                            } else {
                                              parameterInterfaceListenable.value = parameterInterface.copyWithParameter(
                                                parameter..dmxFine = parsedValue,
                                                withError: formHasError(),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                //W! Delete Button
                GestureDetector(
                    onTap: onDelete,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 10),
                      child: Icon(
                        CupertinoIcons.xmark,
                        size: 20,
                        color: IluramaColors.critical.from(context),
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
