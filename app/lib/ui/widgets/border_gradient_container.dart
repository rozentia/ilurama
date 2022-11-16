import 'package:flutter/widgets.dart';

class CustomGradient extends CustomPainter {
  CustomGradient({required this.gradient, required this.sWidth, this.bRadius});

  final Gradient gradient;
  final double sWidth;
  final Paint p = Paint();
  final double? bRadius;

  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(sWidth, sWidth, size.width - sWidth, size.height - sWidth);
    Rect outerRect = Offset.zero & size;

    RRect innerRoundedRect = RRect.fromRectAndRadius(innerRect, Radius.circular(bRadius ?? 0));
    RRect outerRoundedRect = RRect.fromRectAndRadius(outerRect, Radius.circular(bRadius ?? 0));

    p.shader = gradient.createShader(outerRect);
    Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, p);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect) {
    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath = Path()..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class BorderGradientContainer extends StatelessWidget {
  BorderGradientContainer(
      {required gradient, required this.child, this.strokeWidth = 3, this.onPressed, this.bRadius = 0, Key? key})
      : painter = CustomGradient(
          gradient: gradient,
          sWidth: strokeWidth,
          bRadius: bRadius,
        ),
        super(key: key);

  final CustomGradient painter;
  final Widget child;
  final VoidCallback? onPressed;
  final double strokeWidth;
  final double bRadius; // Add border radius

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: painter, child: child);
  }
}
