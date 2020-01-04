import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(-55),
          child: Container(),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            Flexible(
              flex: 9,
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
            Flexible(
              flex: 1,
              child: Column(
                children: <Widget>[Divider(), _config(context)],
              ),
            ),
          ]),
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
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 1, child: Image.asset('assets/stock.png', width: 64))
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
              onTap: () {
                Navigator.pushNamed(context, 'incomes');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('INGRESOS', style: Theme.of(context).textTheme.display1),
                  Image.asset('assets/in.png', width: 64),
                  Container(
                    width: 140.0,
                    child: Text(
                      'Registra tus ingresos de productos/ítems en el sistema',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'sales');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('SALIDAS', style: Theme.of(context).textTheme.display1),
                  Image.asset('assets/out.png', width: 64.0),
                  Container(
                    width: 140.0,
                    child: Text(
                      'Registra tus salidas de productos/ítems en el sistema',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.display3,
                    ),
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
                        'Obtén un informe de tu flujo de ingresos y salidas de dinero en un período de tiempo',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _config(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'providers'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/man.png', width: 28),
                    Text('PROVEEDORES',
                        style: Theme.of(context).textTheme.display2),
                  ],
                ),
              ),
            ),
            VerticalDivider(),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('assets/settings.png', width: 28.0),
                    Text('CONFIGURACIÓN',
                        style: Theme.of(context).textTheme.display2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
