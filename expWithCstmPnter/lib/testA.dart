import 'package:flutter/material.dart';
import 'dart:math';

class TestA extends StatefulWidget {
  @override
  _TestAState createState() => _TestAState();
}

class _TestAState extends State<TestA> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Val: ${_sliderValue * 180 / pi}'),
        Slider(
          value: _sliderValue,
          onChanged: (newVal) {
            setState(() {
              _sliderValue = newVal;
            });
          },
          min: 0,
          max: 2 * pi,
          activeColor: Colors.pink[900],
          inactiveColor: Colors.blueGrey[200],
        ),
        CustomPaint(
          painter: MyPainter(_sliderValue),
          child: Container(
            height: 300,
            width: 300,
          ),
        )
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  double bogenMas;
  MyPainter(this.bogenMas);

  @override
  void paint(Canvas canvas, Size size) {
    var x = size.width / 2;
    var y = size.height / 2;
    var center = Offset(x, y);
    var radius = min(x, y);
    var paint = Paint()
      ..color = Colors.pink[900]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    var paintCircle = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: <Color>[Colors.pink, Colors.pink[900]],
      ).createShader(Rect.fromPoints(Offset(x,0), Offset(size.width,0)));

    print(x);
    canvas.drawCircle(center, radius + 10, paintCircle);
    canvas.drawLine(
        center,
        Offset(
          ((cos(bogenMas - 0.5 * pi) + 1) * (x)),
          ((sin(bogenMas - 0.5 * pi) + 1) * (y)),
        ),
        paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
