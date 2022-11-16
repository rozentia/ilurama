import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class GradientPainter extends CustomPainter {
  GradientPainter({this.gradient, this.strokeWidth = 2.0});

  final Gradient? gradient;
  double? strokeWidth;
  final Paint paintObject = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    strokeWidth = strokeWidth ?? 2.0;
    final Rect innerRect = Rect.fromLTRB(strokeWidth!, strokeWidth!,
        size.width - strokeWidth!, size.height - strokeWidth!);
    final RRect innerRRect = RRect.fromRectAndRadius(
      innerRect,
      const Radius.circular(15),
    );
    final Rect outerRect = Offset.zero & size;
    final RRect outerRRect = RRect.fromRectAndRadius(
      outerRect,
      const Radius.circular(15),
    );

    paintObject.shader = gradient!.createShader(outerRect);
    final Path borderPath = _calculateBorderPath(outerRRect, innerRRect);
    canvas.drawPath(borderPath, paintObject);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect) {
    final Path outerRectPath = Path()..addRRect(outerRect);
    final Path innerRectPath = Path()..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
