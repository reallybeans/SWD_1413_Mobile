import 'dart:math';

import 'package:flutter/material.dart';
final double buttonSize=80;

class Circularfabwidget extends StatefulWidget {

  @override
  _CircularfabwidgetState createState() => _CircularfabwidgetState();
}

class _CircularfabwidgetState extends State<Circularfabwidget> {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(),
      children: <IconData>[
        Icons.message,
        Icons.call,
        Icons.notifications,
        Icons.map
      ].map<Widget>(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData icon) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        elevation: 0,
        splashColor: Colors.black,
        child: Icon(icon,color: Colors.white,size: 45,),
        onPressed: (){},
      ),

    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;

      final radius = 180;

      final theta = i * pi * 0.5 / (n - 2);
      final x = setValue(radius * cos(theta));
      final y = setValue(radius * sin(theta));
      context.paintChild(0, transform: Matrix4.identity()..translate(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
