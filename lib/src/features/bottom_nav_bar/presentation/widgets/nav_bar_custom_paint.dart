import 'package:flutter/material.dart';

class NavBarCustomPainter extends CustomPainter {
  final Color color;
  NavBarCustomPainter({
    super.repaint,
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3571429);
    path_0.cubicTo(0, size.height * 0.1598986, size.width * 0.03292029, 0,
        size.width * 0.07352941, 0);
    path_0.lineTo(size.width * 0.3838382, 0);
    path_0.cubicTo(
        size.width * 0.4031676,
        0,
        size.width * 0.4212618,
        size.height * 0.04611986,
        size.width * 0.4322441,
        size.height * 0.1233741);
    path_0.lineTo(size.width * 0.4714471, size.height * 0.3991386);
    path_0.cubicTo(
        size.width * 0.4853412,
        size.height * 0.4968829,
        size.width * 0.5149941,
        size.height * 0.4980314,
        size.width * 0.5292088,
        size.height * 0.4013757);
    path_0.lineTo(size.width * 0.5706412, size.height * 0.1196464);
    path_0.cubicTo(size.width * 0.5816824, size.height * 0.04456171,
        size.width * 0.5995088, 0, size.width * 0.6185059, 0);
    path_0.lineTo(size.width * 0.9264706, 0);
    path_0.cubicTo(size.width * 0.9670794, 0, size.width,
        size.height * 0.1598986, size.width, size.height * 0.3571429);
    path_0.lineTo(size.width, size.height * 0.6428571);
    path_0.cubicTo(size.width, size.height * 0.8401014, size.width * 0.9670794,
        size.height, size.width * 0.9264706, size.height);
    path_0.lineTo(size.width * 0.5482588, size.height);
    path_0.cubicTo(
        size.width * 0.5361912,
        size.height,
        size.width * 0.5246176,
        size.height * 0.9767171,
        size.width * 0.5160853,
        size.height * 0.9352743);
    path_0.cubicTo(
        size.width * 0.5072029,
        size.height * 0.8921229,
        size.width * 0.4927971,
        size.height * 0.8921229,
        size.width * 0.4839147,
        size.height * 0.9352743);
    path_0.cubicTo(
        size.width * 0.4753824,
        size.height * 0.9767171,
        size.width * 0.4638088,
        size.height,
        size.width * 0.4517412,
        size.height);
    path_0.lineTo(size.width * 0.07352941, size.height);
    path_0.cubicTo(size.width * 0.03292029, size.height, 0,
        size.height * 0.8401014, 0, size.height * 0.6428571);
    path_0.lineTo(0, size.height * 0.3571429);
    path_0.close();

    // ignore: non_constant_identifier_names
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
