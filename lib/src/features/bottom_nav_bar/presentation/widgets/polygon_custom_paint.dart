import 'package:flutter/material.dart';

class PolygonCustomPainter extends CustomPainter {
  final Color color;
  PolygonCustomPainter({
    super.repaint,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4574929, size.height * 0.6021589);
    path_0.cubicTo(
        size.width * 0.4773677,
        size.height * 0.6295366,
        size.width * 0.5226323,
        size.height * 0.6295375,
        size.width * 0.5425071,
        size.height * 0.6021589);
    path_0.lineTo(size.width * 0.6788697, size.height * 0.4143116);
    path_0.cubicTo(
        size.width * 0.7696323,
        size.height * 0.2892821,
        size.width * 0.6680636,
        size.height * 0.1250000,
        size.width * 0.5000000,
        size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.3319364,
        size.height * 0.1250000,
        size.width * 0.2303677,
        size.height * 0.2892821,
        size.width * 0.3211303,
        size.height * 0.4143116);
    path_0.lineTo(size.width * 0.4574929, size.height * 0.6021589);
    path_0.close();

    // ignore: non_constant_identifier_names
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5680707, size.height * 0.3482143);
    path_1.lineTo(size.width * 0.5074646, size.height * 0.3482143);
    path_1.lineTo(size.width * 0.5074646, size.height * 0.4017857);
    path_1.lineTo(size.width * 0.4872626, size.height * 0.4017857);
    path_1.lineTo(size.width * 0.4872626, size.height * 0.3482143);
    path_1.lineTo(size.width * 0.4266566, size.height * 0.3482143);
    path_1.lineTo(size.width * 0.4266566, size.height * 0.3303571);
    path_1.lineTo(size.width * 0.4872626, size.height * 0.3303571);
    path_1.lineTo(size.width * 0.4872626, size.height * 0.2767857);
    path_1.lineTo(size.width * 0.5074646, size.height * 0.2767857);
    path_1.lineTo(size.width * 0.5074646, size.height * 0.3303571);
    path_1.lineTo(size.width * 0.5680707, size.height * 0.3303571);
    path_1.lineTo(size.width * 0.5680707, size.height * 0.3482143);
    path_1.close();

    // ignore: non_constant_identifier_names
    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
