import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';
import 'neumorphic_gradient.w.dart';

enum IluramaButtonShape { square, rounded }

enum IluramaButtonColor { accent, variant, light, dark }

class IluramaButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Widget? iconWidget;
  final IluramaButtonShape shape;
  final IluramaButtonColor color;
  final Color fill;
  final bool bordered;
  final double depth;
  final EdgeInsets padding;
  final double? fontSize;
  final Gradient? gradient;
  final NeumorphicStyle? neumorphicStyle;

  const IluramaButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
    this.iconWidget,
    this.shape = IluramaButtonShape.rounded,
    this.color = IluramaButtonColor.accent,
    this.fill = Colors.transparent,
    this.bordered = false,
    this.depth = 0,
    this.fontSize,
    this.padding = const EdgeInsets.all(0),
    this.gradient,
    this.neumorphicStyle,
  }) : super(key: key);

  factory IluramaButton.borderedRound(
    String text, {
    IconData? icon,
    Widget? iconWidget,
    required void Function() onPressed,
  }) =>
      IluramaButton(
        onPressed: onPressed,
        text: text,
        icon: icon,
        iconWidget: iconWidget,
        bordered: true,
      );

  factory IluramaButton.borderedSquare(
    String text, {
    IconData? icon,
    Widget? iconWidget,
    required void Function() onPressed,
  }) =>
      IluramaButton(
        onPressed: onPressed,
        text: text,
        icon: icon,
        iconWidget: iconWidget,
        bordered: true,
        shape: IluramaButtonShape.square,
      );

  factory IluramaButton.filledRound(
    String text, {
    IconData? icon,
    Widget? iconWidget,
    required void Function() onPressed,
    Gradient? gradient,
  }) =>
      IluramaButton(
        onPressed: onPressed,
        text: text,
        icon: icon,
        iconWidget: iconWidget,
        depth: 6,
        fill: accentColor(),
        gradient: gradient,
        color: IluramaButtonColor.light,
      );

  factory IluramaButton.filledSquare(
    String text, {
    IconData? icon,
    Widget? iconWidget,
    void Function()? onPressed,
    Gradient? gradient,
  }) =>
      IluramaButton(
        onPressed: onPressed,
        text: text,
        icon: icon,
        iconWidget: iconWidget,
        depth: 6,
        shape: IluramaButtonShape.square,
        fill: onPressed != null ? accentColor() : disabledColor(),
        gradient: gradient,
        color: IluramaButtonColor.light,
      );

  @override
  Widget build(BuildContext context) {
    Color _color;
    NeumorphicBoxShape _boxShape;

    switch (color) {
      case IluramaButtonColor.accent:
        _color = accentColor(context);
        break;
      case IluramaButtonColor.variant:
        _color = variantColor(context);
        break;
      case IluramaButtonColor.light:
        _color = Colors.white;
        break;
      case IluramaButtonColor.dark:
        _color = Colors.black;
        break;
      default:
        _color = accentColor(context);
    }

    switch (shape) {
      case IluramaButtonShape.square:
        _boxShape = NeumorphicBoxShape.roundRect(
          const BorderRadius.all(Radius.circular(6)),
        );
        break;
      case IluramaButtonShape.rounded:
        _boxShape = const NeumorphicBoxShape.stadium();
        break;
      default:
        _boxShape = NeumorphicBoxShape.roundRect(
          const BorderRadius.all(Radius.circular(10)),
        );
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 50, maxWidth: 344),
      child: gradient != null
          ? GestureDetector(
              onTap: onPressed,
              child: NeumorphicGradient(
                  gradient: gradient,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  style: neumorphicStyle ??
                      NeumorphicStyle(
                        depth: depth,
                        boxShape: _boxShape,
                        color: fill,
                        border: bordered ? NeumorphicBorder(color: _color, width: 1.5) : const NeumorphicBorder.none(),
                      ),
                  child: Padding(
                    padding: padding,
                    child: ButtonLayout(
                      text: text,
                      icon: icon,
                      color: _color,
                      fontSize: fontSize,
                    ),
                  )),
            )
          : NeumorphicButton(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              style: neumorphicStyle ??
                  NeumorphicStyle(
                    depth: depth,
                    boxShape: _boxShape,
                    color: fill,
                    border: bordered ? NeumorphicBorder(color: _color, width: 1.5) : const NeumorphicBorder.none(),
                  ),
              onPressed: onPressed,
              child: Padding(
                padding: padding,
                child: ButtonLayout(
                  text: text,
                  icon: icon,
                  iconWidget: iconWidget,
                  color: onPressed != null ? _color : secondaryColor(context),
                  fontSize: fontSize,
                ),
              )),
    );
  }
}

class IluramaTextButton extends StatelessWidget {
  final IconData? icon;
  final double iconSize;
  final Color? textColor;

  /// Overall size of the button
  final double size;

  /// Default to accent color of theme
  final Color? iconColor;
  final String? text;
  final void Function() onPressed;
  const IluramaTextButton({
    Key? key,
    this.icon,
    this.iconSize = 28,
    this.text,
    this.textColor,
    required this.onPressed,
    this.iconColor,
    this.size = 44,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: size,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              SizedBox.fromSize(
                size: Size(size, size),
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor ?? accentColor(context),
                    size: iconSize,
                  ),
                ),
              ),
            if (text != null && text!.isNotEmpty)
              Text(
                text!,
                style: button(context).copyWith(color: textColor ?? accentColor(context)),
              )
          ],
        ),
      ),
    );
  }
}

class ButtonLayout extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Widget? iconWidget;
  final Color color;
  final double? fontSize;
  const ButtonLayout({
    Key? key,
    this.text,
    this.icon,
    this.iconWidget,
    this.color = Colors.black,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        widthFactor: 1.13,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Icon(
                      icon,
                      color: color,
                      size: 18,
                    ),
                  ),
                ),
              if (iconWidget != null) iconWidget!,
              Text(
                text!,
                style: button(context).copyWith(
                  color: color,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      );
}
