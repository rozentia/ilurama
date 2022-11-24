// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../widgets/widgets.dart';

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;

  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff00E676),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
  });

  const CustomSnackBar.info({
    Key? key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff2196F3),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
  });

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xffff5252),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return FrostedBox(
      padding: const EdgeInsets.all(0),
      color: widget.backgroundColor,
      decoration: BoxDecoration(
        color: widget.backgroundColor.desaturate().withOpacity(0.15),
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.transparent, borderRadius: widget.borderRadius),
        height: 80,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: widget.iconPositionTop,
              left: widget.iconPositionLeft,
              child: SizedBox(
                  height: 95,
                  child: SvgPicture.string(
                    iluramaLogoIcon,
                    color: widget.backgroundColor.withOpacity(0.05),
                    fit: BoxFit.fitHeight,
                  )),
            ),
            Center(
              child: Padding(
                padding: widget.messagePadding,
                child: Text(
                  widget.message,
                  style: bodyText2(context),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: widget.maxLines,
                  textScaleFactor: widget.textScaleFactor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0.0, 8.0),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));
