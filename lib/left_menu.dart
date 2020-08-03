import 'package:flutter/material.dart';

class LeftMenu extends StatelessWidget {
  final Function toggleVisible;

  LeftMenu({this.toggleVisible});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RaisedButton(
          onPressed: () {
            toggleVisible('Characters');
          },
          child: Text('Characters'),
        ),
        CustomPaint(
          size: Size(200, 00),
          painter: ShapesPainter(),
          child: Container(height: 50,),
        ),
        RaisedButton(
          onPressed: () {
            toggleVisible('Locations');
          },
          child: Text('Locations'),
        ),CustomPaint(
          size: Size(200, 00),
          painter: ShapesPainter(),
          child: Container(height: 50,),
        ),
        RaisedButton(
          onPressed: () {
            toggleVisible('Events');
          },
          child: Text('Events'),
        ),
      ],
    );
  }
}

//ToDo change this so it fits the height and centre of the widgets dynamically, currently hardcoded
class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final p1 = Offset(210,0);
    final p2 = Offset(210,50);
    paint.color = Colors.black;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
