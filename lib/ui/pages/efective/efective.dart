import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/pages/efective/widgets/card_balance.dart';
import 'package:hackaton_pyme_2019/data/example/movements.dart' as movex;
import 'package:hackaton_pyme_2019/ui/pages/voice_chat/voice_chat.dart';

class Efective extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyHomePageVoice(title: 'Asistente',))),
        child: Icon(Icons.voice_chat),
      ),
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
  String _sign(bool income) {
    if (income) {
      return "+";
    }
    return "-";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Lista de Movimientos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Chip(
                label: Text(
                  'Todas',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.teal,
              ),
              SizedBox(width: 8.0),
              Chip(
                  label: Text('Entradas',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400)),
                  backgroundColor: Colors.white),
              SizedBox(width: 8.0),
              Chip(
                label: Text('Salidas',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400)),
                backgroundColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                for (int i = 0; i < movex.listMovements.length; i++)
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal[100],
                          child: Icon(
                            movex.listMovements[i].income
                                ? CupertinoIcons.down_arrow
                                : CupertinoIcons.up_arrow,
                            color: movex.listMovements[i].income
                                ? Colors.blue[700]
                                : Colors.brown[700],
                          ),
                        ),
                        title: Text('${movex.listMovements[i].name}'),
                        trailing: Text(
                          "${_sign(movex.listMovements[i].income)} " +
                              "${movex.listMovements[i].sales} Bs.",
                          style: TextStyle(color: Colors.red),
                        ),
                        subtitle: Text(
                          "${movex.listMovements[i].date}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Divider()
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
