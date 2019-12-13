import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              _inventarios(context),
              Divider(),
              _gestion(context),
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
                    Text('INVENTARIO',
                        style: Theme.of(context).textTheme.display1),
                    Container(
                      // width: 280.0,
                      child: Text(
                        'Obtén informacion detallada, ordenada y valorada de tus productos/ítems',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 1, child: Image.asset('assets/stock.png', width: 64))
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

  Widget _gestion(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'sales'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('INGRESOS', style: Theme.of(context).textTheme.display1),
                  Image.asset('assets/in.png', width: 64),
                  Container(
                    width: 140.0,
                    child: Text(
                      'Registra tu ingresos de productos/items en el sistema',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'sales'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('SALIDAS', style: Theme.of(context).textTheme.display1),
                  Image.asset('assets/out.png', width: 64.0),
                  Container(
                    width: 140.0,
                    child: Text(
                        'Registra tus salidas de productos/items en el sistema',
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _flujoDeCaja(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'efective'),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                  flex: 1, child: Image.asset('assets/cash.png', width: 64.0)),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('EFECTIVO',
                        style: Theme.of(context).textTheme.display1),
                    Container(
                      width: 280.0,
                      child: Text(
                        'Obtén un informe del detalle de tu flujo de ingresos y egresos de dinero en un período que selecciones',
                        textAlign: TextAlign.center,
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
      ),
    );
  }
}
