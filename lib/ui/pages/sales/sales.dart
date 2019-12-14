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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("REGISTRA UNA VENTA"),
                  SizedBox(height: 20.0,),
                  Column(
                    children: <Widget>[
                      CustomButton(
                        child: Text('Historial'),
                        onPressed: () { print("Historial"); },
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        icon: Icon(Icons.history),
                      ),
                      CustomButton(
                        child: Text('Registro Manual'),
                        onPressed: () { showOwnDialog(context); },
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        icon: Icon(Icons.book)
                      ),
                    ],
                  ),
                ],
              ),
            )
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
               onPressed: () => Navigator.pushNamed(context, 'productForm')
             ),
             FlatButton(
               child: Text("Insumo"),
               onPressed: () => Navigator.pushNamed(context, 'insumeForm'),
             ),
           ],
        );
      }
    );
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