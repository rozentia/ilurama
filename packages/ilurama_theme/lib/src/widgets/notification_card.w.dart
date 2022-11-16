import 'dart:ui';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../ilurama_theme.dart';

class NotificationCard extends StatelessWidget {
  final String? prompt;
  final String? title;
  final String? subtitle;
  final Widget? actions;
  const NotificationCard({
    Key? key,
    this.title,
    this.subtitle,
    this.prompt,
    this.actions,
  }) : super(key: key);

  static const double maxHeight = 150.0;
  static const double minHeight = 135.0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: NotificationCard.minHeight,
        maxHeight: NotificationCard.maxHeight,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Neumorphic(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              style: NeumorphicStyle(
                border: NeumorphicBorder(color: dividerColor(context), width: 0.2),
                shape: NeumorphicShape.concave,
                intensity: 0.5,
                color: const ThemeColor(
                  Color.fromRGBO(235, 237, 239, 1),
                  Color.fromRGBO(41, 43, 53, 0.6),
                ).from(context),
                surfaceIntensity: 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (prompt != null && prompt!.isNotEmpty)
                    Text(
                      prompt!,
                      style: overline(context).copyWith(color: secondaryColor(context)),
                    ),
                  if (title != null && title!.isNotEmpty)
                    Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Flexible(
                        child: Text(
                          title!,
                          maxLines: 2,
                          style: headline6(context),
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (subtitle != null && subtitle!.isNotEmpty)
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(subtitle!,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: overline(context).copyWith(color: secondaryColor(context))),
                          ),
                        ),
                    ]),
                  if (actions != null) actions!
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
