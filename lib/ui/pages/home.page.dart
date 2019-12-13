import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              _inventarios(context),
              Divider(),
              _gestion(),
              Divider(),
              _flujoDeCaja(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inventarios(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'inventory'),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'INVENTARIO',
                      style: TextStyle(fontSize: 32.0),
                    ),
                    Container(
                      // width: 280.0,
                      child: Text(
                        'Informacion detallada, ordenada y valorada de los productos/ítems',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/stock.png',
                  width: 64,
                ),
              )
              // Icon(
              //   Icons.inbox,
              //   size: 56,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gestion() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'INGRESOS',
                  style: TextStyle(fontSize: 28.0),
                ),
                Image.asset(
                  'assets/in.png',
                  width: 64,
                ),
                // Icon(
                //   Icons.call_missed_outgoing,
                //   size: 48,
                // ),
                Container(
                  width: 140.0,
                  //padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Registro de ingresos de productos/items en el sistema',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            VerticalDivider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'SALIDAS',
                  style: TextStyle(fontSize: 28.0),
                ),
                Image.asset(
                  'assets/out.png',
                  width: 64.0,
                ),
                // Icon(
                //   Icons.call_missed_outgoing,
                //   size: 48,
                // ),
                Container(
                  width: 140.0,
                  // padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Registro de salidas de productos/items en el sistema',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _flujoDeCaja(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.asset(
                'assets/cash.png',
                width: 64.0,
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'EFECTIVO',
                    style: TextStyle(fontSize: 32.0),
                  ),
                  Container(
                    width: 280.0,
                    child: Text(
                      'Informe que presenta un detalle del flujo de ingresos y egresos de dinero en un período dado',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),
            ),
            // Icon(
            //   Icons.inbox,
            //   size: 56,
            // ),
          ],
        ),
      ),
    );
  }
}
