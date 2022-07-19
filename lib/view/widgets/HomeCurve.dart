// ignore_for_file: file_names

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class HomeCurve extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*0.002398082,size.height*0.2736318);
    path_0.lineTo(size.width*0.9952038,size.height*0.2736318);
    path_0.lineTo(size.width*0.9952038,size.height);
    path_0.lineTo(size.width*0.002398082,size.height);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(0,size.height*0.1900498);
    path_1.arcToPoint(Offset(size.width*0.1683597,size.height*0.1028470),radius: Radius.elliptical(size.width*0.1682494, size.height*0.08726368),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.lineTo(size.width*0.9957242,size.height*0.1028470);
    path_1.lineTo(size.width*0.9957242,size.height*0.3407960);
    path_1.lineTo(0,size.height*0.3407960);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*0.9957242,size.height*0.02062438);
    path_2.cubicTo(size.width*0.9861031,size.height*0.08166915,size.width*0.8830839,size.height*0.1020174,size.width*0.8333741,size.height*0.1028470);
    path_2.lineTo(size.width*0.9957242,size.height*0.1028470);
    path_2.cubicTo(size.width*0.9957242,size.height*0.04823881,size.width*1.005345,size.height*-0.04042289,size.width*0.9957242,size.height*0.02062438);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xfff8f8f8).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}