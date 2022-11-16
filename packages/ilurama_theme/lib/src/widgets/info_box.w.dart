import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';
import 'table_row.w.dart';

/// Widget that shows data in a boxed fashion\
/// Both [data] and [bottom] can be either a String or a Widget
class InfoBox extends StatelessWidget {
  final String title;
  final dynamic data;
  final dynamic bottom;
  final TableRowLocation boxLocation;
  final Axis axis;
  final bool noBorder;
  final double height;

  const InfoBox({
    Key? key,
    required this.title,
    required this.data,
    this.bottom,
    this.boxLocation = TableRowLocation.middle,
    // TODO make this widget usable in vertical axis
    this.axis = Axis.horizontal,
    this.noBorder = false,
    this.height = InfoBox.boxHeight,
  }) : super(key: key);

  static const double boxHeight = 68.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (bottom == null) const Expanded(child: SizedBox()),
                IntrinsicWidth(
                  child: Text(title.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: subtitle2(context).copyWith(
                        color: secondaryColor(context),
                      )),
                ),
                const SizedBox(height: 4),
                if (data is String)
                  IntrinsicWidth(
                    child: Text(
                      data as String,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: headline6(context).copyWith(color: accentColor(context), fontWeight: FontWeight.w700),
                    ),
                  ),
                if (data is Widget) data as Widget,
                if (bottom != null) const SizedBox(height: 4),
                if (bottom is String)
                  IntrinsicWidth(
                    child: Text(bottom as String,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: subtitle2(context).copyWith(
                          fontSize: 11,
                          fontWeight: FW.regular,
                          letterSpacing: -0.2,
                          color: secondaryColor(context),
                        )),
                  ),
                if (bottom is Widget) Flexible(child: bottom as Widget),
                if (bottom == null) const Expanded(child: SizedBox()),
              ],
            ),
          ),
          if (noBorder)
            const SizedBox(width: 0, height: 0)
          else if (boxLocation == TableRowLocation.first || boxLocation == TableRowLocation.middle)
            Flexible(
              child: Container(
                width: 1,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(border: Border(right: dividerBorder(context))),
              ),
            )
        ]));
  }
}
