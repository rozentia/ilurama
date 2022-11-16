import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/core/core.dart';
import '../../../../models/models.dart';
import '../../../components/components.dart';
import '../../../widgets/widgets.dart';
import '../../modals/color_code_parameter_info.vw.dart';
import 'color_code_form.vm.dart';
import 'color_code_form_parameter_row.dart';

class ColorCodeFormView extends StatelessWidget {
  final ColorCode? colorCodeToEdit;
  const ColorCodeFormView({Key? key, this.colorCodeToEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: colorCodeToEdit?.name);
    final TextEditingController descriptionController = TextEditingController(text: colorCodeToEdit?.description);
    return ViewModelBuilder<ColorCodeFormViewModel>.reactive(
        viewModelBuilder: () => ColorCodeFormViewModel(colorCodeToEdit: colorCodeToEdit),
        builder: (context, model, widget) {
          return Stack(
            children: [
              IluramaFrostedScaffold(
                appBarForegroundAlwaysVisible: true,
                appBarTitle: (colorCodeToEdit != null ? 'title_new_color_code' : 'title_edit_color_code').tr(),
                appBarLeading: IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  alignment: Alignment.centerLeft,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    CupertinoIcons.xmark_circle,
                    color: criticalColor(context),
                  ),
                ),
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
                      text: colorCodeToEdit != null ? 'msg_update'.tr() : 'msg_create'.tr())
                ],
                slivers: [
                  const SliverPadding(padding: EdgeInsets.all(30)),
                  //W! Title
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
                                  'msg_color_code_must_have_title'.tr(),
                                  style: bodyText2(context).copyWith(color: IluramaColors.critical.from(context)),
                                ))
                        ],
                      ),
                    ),
                  ),
                  //W! Description
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
                  //W! Parameters Label
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 2, 0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('title_colorcode_parameters.parameters'.tr().toUpperCase(),
                                  style: overline(context).copyWith(color: secondaryColor(context))),
                              //W! Parameters Info Button
                              IconButton(
                                  onPressed: () => showCupertinoModalBottomSheet(
                                      context: context, builder: (_) => const ColorCodeParameterInfoModalView()),
                                  icon: const Icon(CupertinoIcons.info, color: IluramaColors.accentColor)),
                              //W! Input Mode Toggle
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: SizedBox(
                                  width: 85,
                                  child: AnimatedToggleSwitch<InputMode>.dual(
                                    height: 24,
                                    indicatorSize: const Size(22.0, double.infinity),
                                    borderWidth: 1.5,
                                    borderColor: IluramaColors.accentColor,
                                    indicatorColor: IluramaColors.accentColor,
                                    current: model.selectedInputMode,
                                    first: InputMode.percent,
                                    second: InputMode.dmx,
                                    onChanged: (_) => model.toggleInputMode(),
                                    iconBuilder: (selectedMode) => selectedMode == InputMode.percent
                                        ? Icon(
                                            CupertinoIcons.percent,
                                            size: 14,
                                            color: IluramaColors.canvasColor.from(context),
                                          )
                                        : Icon(
                                            CupertinoIcons.number,
                                            size: 14,
                                            color: IluramaColors.canvasColor.from(context),
                                          ),
                                    textBuilder: (selectedMode) => Text(
                                      selectedMode == InputMode.percent ? 'text_percent'.tr().toUpperCase() : 'DMX',
                                      style: caption(context).copyWith(fontSize: 9, color: secondaryColor(context)),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox(width: double.infinity)),
                              //W! Add Parameter Button
                              IconButton(
                                onPressed: model.onCreateParameter,
                                icon: const Icon(CupertinoIcons.plus_circle_fill, color: IluramaColors.accentColor),
                              ),
                              if (model.hasErrorForKey(model.validationErrorKey) && !model.titleValid)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: Text(
                                    'msg_invalid_input_in_parameters'.tr(),
                                    style: bodyText2(context).copyWith(color: IluramaColors.critical.from(context)),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //W! Parameters
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          if (model.activeParameters.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25),
                              child: Text(
                                'msg_tap_to_add_color_code_parameters'.tr(),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: bodyText2(context).copyWith(color: secondaryColor(context)),
                              ),
                            ),
                          ...model.activeParametersInterfaceNotifiers
                              .asMap()
                              .map<int, Widget>(
                                (index, parameterInterface) => MapEntry(
                                  index,
                                  ParameterRow(
                                    parameterInterfaceListenable: parameterInterface,
                                    onDelete: () => model.deleteParameter(index),
                                    unusedParameterTypesNotifier: model.unsusedColorCodeParameterTypesNotifier,
                                    inputMode: model.selectedInputMode,
                                  ),
                                ),
                              )
                              .values
                        ],
                      ),
                    ),
                  ),
                  //W! Empty Space
                  const SliverToBoxAdapter(
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 50), child: SizedBox(height: 180))),
                ],
              ),
              //W! Lower Area
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 180 + (colorCodeToEdit == null ? 0 : 70),
                  child: Neumorphic(
                    style: const NeumorphicStyle(intensity: 0.6, depth: 15, lightSource: LightSource.bottom),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        const FrostedRect(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //W! Coded Color Representation
                              SizedBox(
                                  height: 120,
                                  child: ValueListenableBuilder<String?>(
                                      valueListenable: model.resolvedHex,
                                      builder: (context, resolvedHex, widget) {
                                        return CodedColorRepresentationExpanded(ColorCode(hex: resolvedHex));
                                      })),
                              //W! Delete Button
                              if (colorCodeToEdit != null)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CupertinoButton(
                                    color: ColorPalette.fireEngineRed,
                                    onPressed: () => showDialog<bool>(
                                        context: context,
                                        builder: (_) => AlertYesNo(
                                              title: 'msg_title_delete_color_code'.tr(),
                                              message: 'msg_confirmation_delete_color_code'.tr(),
                                            )).then((result) => result == true
                                        ? Navigator.pop<CRUDActions>(context, const CRUDActions.delete())
                                        : null),
                                    child: 'msg_title_delete_color_code'.tr().asButton(context),
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
