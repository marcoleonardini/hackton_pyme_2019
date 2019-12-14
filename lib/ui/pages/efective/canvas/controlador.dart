import 'package:flutter/material.dart';

class ControlPainter extends CustomPainter{
  
  final Color color;
  final Paint trackPaint;
  final Paint backPaint;
  final double control;

  ControlPainter({this.control,@required this.color}): trackPaint = new Paint()
    ..color = color
    ..style = PaintingStyle.fill,
    backPaint = new Paint()
    ..color = Colors.black45
    ..style = PaintingStyle.fill;


  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
              0.0,
              0.0,
              80.0,
              12.0
          ),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        backPaint);

        canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
              0.0,
              0.0,
              control,
              12.0
          ),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        trackPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}