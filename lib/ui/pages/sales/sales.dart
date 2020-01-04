import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SalesScreen extends StatefulWidget {
  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      "Registra una venta",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .apply(color: Colors.blueGrey),
                    ))),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomButton(
                          child: Text('Historial'),
                          onPressed: () {
                            print("Historial");
                          },
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          icon: Icon(Icons.history),
                        ),
                      ),
                      VerticalDivider(color: Colors.grey[600]),
                      Expanded(
                        child: CustomButton(
                            child: Text('Registro Manual'),
                            onPressed: () {
                              showOwnDialog(context);
                            },
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            icon: Icon(CupertinoIcons.bookmark_solid)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showOwnDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("¿Desea registrar un producto o un insumo? :"),
            actions: <Widget>[
              FlatButton(
                  child: Text("Producto"),
                  onPressed: () => Navigator.pushNamed(context, 'productForm')),
              FlatButton(
                child: Text("Insumo"),
                onPressed: () => Navigator.pushNamed(context, 'insumeForm'),
              ),
            ],
          );
        });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
