import 'dart:math';

import 'package:flutter/material.dart';

class TestStuff extends StatefulWidget {
  @override
  _TestStuffState createState() => _TestStuffState();
}

class _TestStuffState extends State<TestStuff> {
  var lineEndX = 60.0;
  var lineEndY = 60.0;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            setState(() {
              lineEndX = sqrt(pow((400/2),2)-pow(lineEndY-(400 / 2),2))+200;
              lineEndY = sqrt(pow((400/2),2)-pow(lineEndX-(400 / 2),2))+200;
            });
            print(lineEndY);
            print(lineEndX);
          },
          child: Container(
          height: 400,
          width: 400,
          child: CustomPaint(
            painter: MyPainter(lineEndX,lineEndY),
          )),
    );
  }
}

class MyPainter extends CustomPainter {

  var lineEndX = 0.0;
  var lineEndY = 0.0;

  MyPainter(lineEndX, lineEndY)
  {
    this.lineEndX = lineEndX;
    this.lineEndY = lineEndY;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var position = Offset(lineEndX, lineEndY);

    var fillBrush = Paint()
    ..color=Colors.white
    ..strokeWidth= 15
    ..strokeCap=StrokeCap.round;

    canvas.drawLine(center, position, fillBrush);

  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
