import 'package:flutter/material.dart';

class LnRCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3944235);
    path_0.lineTo(size.width * 0.9957237, size.height * 0.3944235);
    path_0.lineTo(size.width * 0.9957237, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.2199598);
    path_1.arcToPoint(Offset(size.width * 0.1683591, size.height * 0.1190304),
        radius:
            Radius.elliptical(size.width * 0.1683591, size.height * 0.1009294),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 0.9957237, size.height * 0.1190304);
    path_1.lineTo(size.width * 0.9957237, size.height * 0.3944235);
    path_1.lineTo(0, size.height * 0.3944235);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9957237, size.height * 0.02386981);
    path_2.cubicTo(
        size.width * 0.9861032,
        size.height * 0.09452040,
        size.width * 0.8830842,
        size.height * 0.1180701,
        size.width * 0.8333774,
        size.height * 0.1190318);
    path_2.lineTo(size.width * 0.9957237, size.height * 0.1190318);
    path_2.cubicTo(
        size.width * 0.9957237,
        size.height * 0.05582983,
        size.width * 1.005344,
        size.height * -0.04678078,
        size.width * 0.9957237,
        size.height * 0.02386981);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
