import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/pages/efective/widgets/controler_graphic.dart';

class CardBalance extends StatelessWidget {
  final String title;
  final double sales;
  final Color color;
  final bool progress;

  CardBalance({
    this.color = Colors.white,
    this.progress = false,
    @required this.sales,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: progress ? Alignment.centerLeft : Alignment.center,
            child: Text(title,
                style: TextStyle(
                    fontSize: progress ? 20 : 24.0,
                    color: Colors.white,
                    fontFamily: 'PatrickHand')),
          ),
          SizedBox(height: 8.0),
          Text("\$ ${sales.toString()}",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          progress
              ? Row(children: <Widget>[
                  Expanded(child: Controlador(color: Colors.white, tamano: 66)),
                  Icon(Icons.info, size: 24.0, color: Colors.white)
                ])
              : Container(),
          //Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
