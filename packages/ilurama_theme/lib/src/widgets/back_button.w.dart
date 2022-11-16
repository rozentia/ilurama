import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../styles/styles.dart';

class IluramaBackButton extends StatelessWidget {
  const IluramaBackButton({
    Key? key,
    this.color,
    this.onPressed,
    this.info,
    this.secondaryColor,
    this.showSecondary = false,
  }) : super(key: key);
  final String? info;
  final Color? color;
  final Color? secondaryColor;
  final VoidCallback? onPressed;
  final bool showSecondary;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    const animationDuration = Duration(milliseconds: 200);
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Stack(
          children: [
            AnimatedPositioned(
              left: showSecondary ? 10 : 0,
              duration: animationDuration,
              child: AnimatedOpacity(
                  opacity: showSecondary ? 1.0 : 0.0,
                  duration: animationDuration,
                  child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(
                        CupertinoIcons.chevron_left_circle,
                        size: 28,
                        color: secondaryColor ?? variantColor(context).withOpacity(0.9),
                      ))),
            ),
            AnimatedOpacity(
              opacity: showSecondary ? 0.0 : 1.0,
              duration: animationDuration,
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.chevron_back,
                    size: 32,
                    color: color ?? accentColor(context),
                  ),
                  if (info != null)
                    Text(
                      info!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: bodyText1(context).copyWith(
                        color: color ?? accentColor(context), height: 1.5,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
