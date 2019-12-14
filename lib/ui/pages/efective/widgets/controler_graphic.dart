import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/pages/efective/canvas/controlador.dart';

class Controlador extends StatefulWidget {
  final Color color;
  final double tamano;
  Controlador({this.tamano, @required this.color});

  @override
  _ControladorState createState() => _ControladorState();
}

class _ControladorState extends State<Controlador> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ControlPainter(control: widget.tamano, color: widget.color),
      child: Container(),
    );
  }
}
