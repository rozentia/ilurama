import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ilurama_theme/ilurama_theme.dart' hide ExtendedColor;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stacked/stacked.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../app/extensions/extensions.dart';
import '../../../app/routes/routes.dart';
import '../../../models/models.dart';
import '../../components/components.dart';
import '../../widgets/widgets.dart';
import 'content.vm.dart';
import 'forms/collection_form.vw.dart';
import 'forms/color_code_form.vw.dart';

class ContentView extends StatelessWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContentViewModel>.reactive(
      disposeViewModel: true,
      builder: (context, model, child) {
        debugPrint('built content view');
        return IluramaFrostedScaffold(
          appBarForegroundAlwaysVisible: true,
          appBarAlwaysVisible: true,
          appbarHeight: 110,
          customAppbarForeground: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Row(
                  children: [
                    //W! Add Button
                    IconButton(
                      icon: Icon(CupertinoIcons.add,
                          color: model.selectedTabType.maybeWhen<Color>(
                              sceneType: () => secondaryColor(context).withOpacity(0.4),
                              orElse: () => IluramaColors.accentColor)),
                      iconSize: 25,
                      padding: const EdgeInsets.all(0),
                      onPressed: () => model.selectedTabType.when(
                        collectionType: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                          barrierColor: barrierModalColor(context),
                          context: context,
                          useRootNavigator: true,
                          builder: (_) => const CollectionFormView(),
                        ).then((_) => model.notifyListeners()),
                        colorCodeType: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                          barrierColor: barrierModalColor(context),
                          context: context,
                          useRootNavigator: true,
                          builder: (_) => const ColorCodeFormView(),
                        ).then((_) => model.notifyListeners()),
                        //FFEATURE Implement this
                        sceneType: () => null,
                      ),
                    )
                  ],
                ),
                //W! Content Toggle
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  child: NeumorphicToggle(
                    selectedIndex: model.selectedTab,
                    onChanged: model.updateTab,
                    children: model.tabs.keys
                        .map<ToggleElement>((localizedLabel) => ToggleElement(
                              foreground: Center(
                                  child: Text(
                                localizedLabel.tr().toUpperCase(),
                                style: caption(context).copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                              background: Center(child: localizedLabel.tr().toUpperCase().asCaption(context)),
                            ))
                        .toList(),
                    thumb: Neumorphic(
                      style: NeumorphicStyle(
                        border: context.brightness == Brightness.light
                            ? NeumorphicBorder(color: Colors.grey.shade400)
                            : const NeumorphicBorder.none(),
                        color: IluramaColors.secondaryColor
                            .from(context)
                            .withOpacity(context.brightness == Brightness.light ? 0.1 : 0.4),
                        shape: NeumorphicShape.convex,
                        surfaceIntensity: context.brightness == Brightness.light ? 0.4 : 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          slivers: [
            SliverPadding(padding: EdgeInsets.all(MediaQuery.of(context).viewPadding.top + 40)),
            model.selectedTabType.when<Widget>(
              //W! Collection Page
              collectionType: () {
                if (model.userCollections.isEmpty) {
                  return SliverToBoxAdapter(
                      child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text('msg_tap_to_create_collection'.tr(),
                              textAlign: TextAlign.center, maxLines: 4, style: bodyText1(context))));
                } else {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) => FutureBuilder<List<Color>>(
                      future: model.getColorsForCollection(model.userCollections[index]),
                      builder: (context, AsyncSnapshot<List<Color>> snapshot) => Slidable(
                        key: Key(model.userCollections[index].id),
                        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                              onPressed: (context) => showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertYesNo(
                                      title: 'msg_delete_collection'.tr(),
                                      message: 'msg_delete_collection_confirm'.tr(),
                                    ),
                                  ).then((result) {
                                    if (result == null) return;
                                    if (result) {
                                      model.deleteCollection(model.userCollections[index]).then((result) {});
                                    }
                                  }),
                              backgroundColor: IluramaColors.critical.from(context),
                              foregroundColor: IluramaColors.overCritical,
                              icon: CupertinoIcons.trash,
                              label: 'menu_items.delete'.tr())
                        ]),
                        child: CollectionRow(
                          model.userCollections.elementAt(index),
                          parentItemName: 'tab_title_content'.tr(),
                          collectionColors:
                              (snapshot.data ?? [secondaryColor(context), baseColor(context)]).seamlessSweep,
                          onTap: () => context.router.push(
                            CollectionItemRoute(
                                collectionId: model.userCollections.elementAt(index).id,
                                parentRouteShortTitle: 'title_collection_plural'.tr()),
                          ),
                        ),
                      ),
                    ),
                    childCount: model.userCollections.length,
                  ));
                }
              },
              //W! Color Code Page
              colorCodeType: () {
                if (model.userColorCodes.isEmpty) {
                  return SliverToBoxAdapter(
                      child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text('msg_tap_to_create_a_color_code'.tr(),
                              textAlign: TextAlign.center, maxLines: 4, style: bodyText1(context))));
                } else {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) => Slidable(
                      key: Key(model.userColorCodes[index].id),
                      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                        SlidableAction(
                            onPressed: (context) => showDialog<bool>(
                                  context: context,
                                  builder: (_) => AlertYesNo(
                                    title: 'msg_title_delete_color_code'.tr(),
                                    message: 'msg_confirmation_delete_color_code_x'
                                        .tr(args: [model.userColorCodes[index].name ?? 'text_unknown'.tr()]),
                                  ),
                                ).then((result) {
                                  if (result == null) return;
                                  if (result) {
                                    model.deleteColorCode(model.userColorCodes[index]).then((result) {});
                                  }
                                }),
                            backgroundColor: IluramaColors.critical.from(context),
                            foregroundColor: IluramaColors.overCritical,
                            icon: CupertinoIcons.trash,
                            label: 'menu_items.delete'.tr())
                      ]),
                      child: ColorCodeRow(
                        model.userColorCodes.elementAt(index),
                        parentItemName: 'title_color_code_plural'.tr(),
                      ),
                    ),
                    childCount: model.userColorCodes.length,
                  ));
                }
              },
              //= Scene Page
              sceneType: () {
                if (model.userScenes.isEmpty) {
                  return SliverToBoxAdapter(
                      child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text('msg_tap_to_create_a_color_scene'.tr(),
                              textAlign: TextAlign.center, maxLines: 4, style: bodyText1(context))));
                } else {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    //FFEATURE Implement this
                    (context, index) => const SizedBox.square(dimension: 1),
                    childCount: model.userScenes.length,
                  ));
                }
              },
            ),
          ],
        );
      },
      viewModelBuilder: () => ContentViewModel(),
    );
  }
}

class ColorCodeRow extends StatelessWidget {
  final void Function()? onTap;
  final ColorCode doc;
  final String? parentItemName;
  const ColorCodeRow(
    this.doc, {
    Key? key,
    this.onTap,
    @required this.parentItemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IluramaTableRow(
      onTap: () => onTap != null
          ? onTap!()
          : context.router.push(
              ColorCodeItemRoute(
                colorCodeId: doc.id,
                parentRouteShortTitle: parentItemName,
              ),
            ),
      key: Key(doc.id),
      title: doc.name,
      subtitleText: doc.description,
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CodedColorRepresentation(
          TinyColor.fromString((doc.hex ?? '#FFFFFF').colorHexString).color,
          hideCode: true,
          size: 35,
        ),
      ),
    );
  }
}
