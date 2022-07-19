import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class WavyGetStarted extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5576742);
    path_0.arcToPoint(Offset(size.width * 0.1683591, size.height * 0.3017832),
        radius:
            Radius.elliptical(size.width * 0.1683591, size.height * 0.2558910),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.9957237, size.height * 0.3017832);
    path_0.lineTo(size.width * 0.9957237, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9957237, size.height * 0.06051822);
    path_1.cubicTo(
        size.width * 0.9861032,
        size.height * 0.2396419,
        size.width * 0.8830842,
        size.height * 0.2993486,
        size.width * 0.8333774,
        size.height * 0.3017869);
    path_1.lineTo(size.width * 0.9957237, size.height * 0.3017869);
    path_1.cubicTo(
        size.width * 0.9957237,
        size.height * 0.1415479,
        size.width * 1.005344,
        size.height * -0.1186055,
        size.width * 0.9957237,
        size.height * 0.06051822);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
//  Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CustomPaint(
//                 size: Size(
//                     double.infinity,
//                     (300 * 0.657932839159359)
//                         .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                 painter: WavyGetStarted(),
//               ),
//             ],
//           )