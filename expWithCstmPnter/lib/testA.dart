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
        Text('Val: ${_sliderValue*180/pi}'),
        Slider(
          value: _sliderValue,
          onChanged: (newVal){
            setState(() {
              _sliderValue = newVal;
            });
          },
          min: 0,
          max: 2*pi,
          activeColor: Colors.red,
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
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

 
    print(x);
    canvas.drawLine(center, 
    Offset(
      
    ((cos(bogenMas)+1)*(x)),
    ((sin(bogenMas)+1)*(y)),
    
    )
    
    , paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}
