import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/pages/efective/widgets/card_balance.dart';

class Efective extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.black),
        ),
        brightness: Brightness.light,
        title: Text('Flujo de caja', style: Theme.of(context).textTheme.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Flexible(flex: 2, child: CardsBalance()),
          Flexible(flex: 2, child: TabNavigation())
        ],
      ),
    );
  }
}

class CardsBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Flexible(
              flex: 2,
              child: CardBalance(
                  title: 'Mi Balance', sales: 3890.0, color: Colors.teal[700])),
          SizedBox(height: 32),
          Flexible(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: CardBalance(
                        title: 'Ingresos',
                        progress: true,
                        sales: 5421.0,
                        color: Colors.brown[700])),
                SizedBox(width: 32.0),
                Expanded(
                    child: CardBalance(
                        title: 'Egresos',
                        progress: true,
                        sales: 2346,
                        color: Colors.blue[700])),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
