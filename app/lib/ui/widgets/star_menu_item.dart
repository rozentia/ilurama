import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:star_menu/star_menu.dart';

import 'frosted_box.dart';

StarMenuParameters getStarMenuParameters(
  BuildContext context, {
  double offsetX = -100,
  double offsetY = 40,
  LinearAlignment alignment = LinearAlignment.right,
}) =>
    StarMenuParameters.dropdown(context).copyWith(
      checkItemsScreenBoundaries: true,
      backgroundParams: BackgroundParams(
        animatedBlur: true,
        sigmaX: 25.0,
        sigmaY: 25.0,
        animatedBackgroundColor: true,
        backgroundColor: const Color(0xFF747480).withOpacity(0.3),
      ),
      boundaryBackground: BoundaryBackground(
        color: Colors.transparent,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: context.brightness == Brightness.dark ? Colors.black38 : Colors.black26,
            ),
          ],
        ),
      ),
      linearShapeParams: LinearShapeParams(angle: -90, alignment: alignment),
      animationCurve: Curves.bounceInOut,
      centerOffset: Offset(offsetX, offsetY),
    );

class StarMenuItem<T> {
  final String label;
  final IconData icon;
  final T action;

  StarMenuItem(this.label, this.icon, this.action);
}

extension StarMenuItems on List<StarMenuItem> {
  List<Widget> get getRows => asMap()
      .map((index, menuItem) => MapEntry(
          index,
          StarMenuItemRow(
            menuItem,
            itemIndex: index,
            itemsLength: length,
          )))
      .values
      .toList();
}

class StarMenuItemRow extends StatelessWidget {
  final int itemIndex;
  final int itemsLength;
  final StarMenuItem item;
  final double backgroundOpacityLight;
  final double backgroundOpacityDark;
  const StarMenuItemRow(
    this.item, {
    Key? key,
    this.itemIndex = 0,
    this.itemsLength = 0,
    this.backgroundOpacityLight = 0.9,
    this.backgroundOpacityDark = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 45.0;
    const double blurAmount = 5.0;
    final double screen60width = 0.6 * MediaQuery.of(context).size.width;
    final Color bgColor = context.brightness == Brightness.light
        ? Colors.white.withOpacity(backgroundOpacityLight)
        : const Color(0xFF181818).withOpacity(backgroundOpacityDark);
    final List<Shadow> shadows = [
      Shadow(
        blurRadius: 15,
        color: context.brightness == Brightness.light ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.4),
      )
    ];
    return SizedBox(
      width: screen60width,
      height: itemHeight,
      child: Stack(
        children: [
          //= First Item
          if (itemIndex == 0)
            FrostedBox(
              blur: blurAmount,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                color: bgColor,
              ),
              child: SizedBox(width: screen60width, height: itemHeight),
            )
          //= Last Item
          else if (itemIndex == itemsLength - 1)
            FrostedBox(
              blur: blurAmount,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                color: bgColor,
              ),
              child: SizedBox(width: screen60width, height: itemHeight),
            )
          //= Middle Item
          else
            FrostedBox(
              blur: blurAmount,
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.zero),
              child: SizedBox(width: screen60width, height: itemHeight),
            ),
          //= Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: bodyText2(context).copyWith(shadows: shadows),
                  ),
                  Icon(
                    item.icon,
                    size: 20,
                    color: bodyText1(context).color,
                    shadows: shadows,
                  )
                ],
              ),
            ),
          ),
          //= Separator
          if (itemIndex != 0)
            Positioned(
              child: Container(
                height: 0.5,
                color: context.brightness == Brightness.light
                    ? const Color(0xFF3C3C43).withOpacity(0.36)
                    : const Color(0xFF545458).withOpacity(0.76),
              ),
            )
        ],
      ),
    );
  }
}
