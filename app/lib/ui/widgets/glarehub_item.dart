import 'package:flutter/cupertino.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama/entities/color_item/color_item.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
// import 'package:tinycolor2/tinycolor2.dart';

import '../../models/models.dart';
import 'border_gradient_container.dart';

class ColorItemBox extends StatelessWidget {
  final ColorItem item;
  final bool selected;

  const ColorItemBox(this.item, {Key? key, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (selected)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: IluramaColors.accentColor),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        SizedBox.square(
          dimension: 90, //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: item.item.fold(
                    (product) => item.type.when<Widget>(
                          colorFilter: () => ColorFilterRepresentation(item.color, item.itemCode),
                          diffusionFilter: () =>
                              DiffuseFilterRepresentation(item.color, item.itemCode, item.imageFileName),
                          technicalFilter: () => TechnicalFilterRepresentation(item.color, item.itemCode),
                          glassFilter: () => GlassFilterRepresentation(item.color, item.itemCode),
                        ),
                    (colorCode) => CodedColorRepresentation(colorCode.safeColor)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: overline(context).copyWith(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (selected)
          const Align(
            alignment: Alignment.topLeft,
            child: Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: IluramaColors.accentColor,
              size: 24,
            ),
          ),
      ],
    );
  }
}

///@
class DiffuseFilterRepresentation extends StatelessWidget {
  const DiffuseFilterRepresentation(
    this.itemColor,
    this.itemCode,
    this.itemImageFile, {
    this.size = 50.0,
    this.expanded = true,
    this.hideCode = false,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  final Color itemColor;
  final String itemCode;
  final String? itemImageFile;
  final double size;
  final bool hideCode;
  final bool expanded;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          itemImageFile == null
              ? Container(
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? size)),
                  ),
                )
              : SizedBox(
                  width: expanded ? double.infinity : size,
                  height: expanded ? double.infinity : size,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius ?? size),
                    child: Image(
                      image: AssetImage('assets/images/product_images/$itemImageFile'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          if (!hideCode) solveProductCodeText(null, itemCode, context),
        ],
      ),
    );
  }
}

///@
class TechnicalFilterRepresentation extends StatelessWidget {
  const TechnicalFilterRepresentation(
    this.itemColor,
    this.itemCode, {
    this.size = 50.0,
    this.hideCode = false,
    Key? key,
  }) : super(key: key);

  final Color itemColor;
  final String itemCode;
  final double size;
  final bool hideCode;

  @override
  Widget build(BuildContext context) {
    final innerBorderColor = itemColor.isDark ? itemColor.lighten(20) : itemColor.darken(20);
    return SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: itemColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              margin: EdgeInsets.all(size / 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: innerBorderColor,
                  )),
            ),
            if (!hideCode) solveProductCodeText(itemColor, itemCode, context),
          ],
        ));
  }
}

///@
class ColorFilterRepresentation extends StatelessWidget {
  const ColorFilterRepresentation(
    this.itemColor,
    this.itemCode, {
    this.hideCode = false,
    Key? key,
    this.borderRadius,
  }) : super(key: key);

  final Color itemColor;
  final String itemCode;
  final bool hideCode;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(25)),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
            ),
            if (!hideCode) solveProductCodeText(itemColor, itemCode, context),
          ],
        ),
      );
}

class ColorFilterRepresentationExpanded extends StatelessWidget {
  final Color itemColor;
  final String itemCode;

  const ColorFilterRepresentationExpanded({
    required this.itemColor,
    required this.itemCode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        (itemColor.isDark ? itemColor.tinyColor.lighten(20) : itemColor.tinyColor.darken(10)).color;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: itemColor,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ],
    );
  }
}

///@
class CodedColorRepresentation extends StatelessWidget {
  const CodedColorRepresentation(
    this.itemColor, {
    this.size = 50.0,
    this.hideCode = false,
    Key? key,
  }) : super(key: key);

  final Color itemColor;
  final double size;
  final bool hideCode;

  factory CodedColorRepresentation.icon() {
    return const CodedColorRepresentation(IluramaColors.accentColor);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: itemColor),
              borderRadius: BorderRadius.all(Radius.circular(size)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  color: itemColor,
                  borderRadius: BorderRadius.all(Radius.circular(size)),
                ),
              ))
        ],
      ),
    );
  }
}

class CodedColorRepresentationExpanded extends StatelessWidget {
  final ColorCode colorCode;
  const CodedColorRepresentationExpanded(this.colorCode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemColor = colorCode.hex == null ? secondaryColor(context).withOpacity(0.3) : colorCode.safeColor;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: itemColor,
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10.0)]),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: itemColor, width: 5),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}

///@
class GlassFilterRepresentation extends StatelessWidget {
  const GlassFilterRepresentation(
    this.itemColor,
    this.itemCode, {
    this.size = 50.0,
    this.hideCode = false,
    Key? key,
  }) : super(key: key);

  final Color itemColor;
  final String itemCode;
  final double size;
  final bool hideCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                color: itemColor,
                depth: 5,
                intensity: 10,
                surfaceIntensity: 1.5,
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(10),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            if (!hideCode) solveProductCodeText(itemColor, itemCode, context),
          ],
        ));
  }
}

class CollectionColorsRepresentation extends StatelessWidget {
  const CollectionColorsRepresentation(
    this.colors, {
    Key? key,
    this.bRadius = 30,
    this.strokeWidth = 10,
    this.boxSize = 40,
  }) : super(key: key);

  final List<Color> colors;
  final double bRadius;
  final double strokeWidth;
  final double boxSize;

  factory CollectionColorsRepresentation.icon() {
    return const CollectionColorsRepresentation(
      [
        Colors.red,
        Colors.amber,
        Colors.yellow,
        Colors.green,
        Colors.teal,
        Colors.lightBlue,
        Colors.indigo,
        Colors.purple,
        Colors.pink,
      ],
      boxSize: 50,
      bRadius: 40,
      strokeWidth: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BorderGradientContainer(
        bRadius: bRadius,
        strokeWidth: strokeWidth,
        gradient: SweepGradient(colors: colors.seamlessSweep),
        child: SizedBox.square(dimension: boxSize));
  }
}

///@
Widget solveProductCodeText(Color? color, String code, BuildContext context,
    {double fontSize = 11, FontWeight fontWeight = FontWeight.w700}) {
  return Text(
    code,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: caption(context).copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color == null
            ? Colors.white
            : color.isLight
                ? Colors.black
                : Colors.white),
  );
}
