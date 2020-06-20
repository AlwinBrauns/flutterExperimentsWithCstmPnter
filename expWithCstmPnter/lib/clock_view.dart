import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    // ( Paint()..color = ) <=> ( var brush = Paint(); brush.color = )
    var fillBrush = Paint()..color = Colors.blueGrey[900];
    var outlineBrush = Paint()
      ..color = Colors.blueGrey[100]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    var secBrush = Paint()
      ..shader = RadialGradient(colors: [
        Colors.lightBlue,
        Colors.pink,
      ]).createShader(Rect.fromCircle(center: center,radius: radius,))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

      var minBrush = Paint()
      ..shader = RadialGradient(colors: [
        Colors.lightGreen,
        Colors.blue,
      ]).createShader(Rect.fromCircle(center: center,radius: radius,))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

      var hourBrush = Paint()
      ..shader = RadialGradient(colors: [
        Colors.red,
        Colors.green,
      ]).createShader(Rect.fromCircle(center: center,radius: radius,))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;
      

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    canvas.drawLine(center, Offset(150, 100), hourBrush);
    canvas.drawLine(center, Offset(175, 80), minBrush);
    canvas.drawLine(center, Offset(100, 75), secBrush);
    canvas.drawCircle(center, 0 + (radius / 12), fillBrush
    ..color = Colors.blueGrey[100]);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
