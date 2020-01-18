import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/data/constant.dart' as constant;
import 'package:hackaton_pyme_2019/models/insume.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ContentAlertScan extends StatefulWidget {
  final BuildContext context;
  final Insume insume;
  ContentAlertScan({this.context, @required this.insume});

  @override
  _ContentAlertScanState createState() => _ContentAlertScanState();
}

class _ContentAlertScanState extends State<ContentAlertScan> {
  bool _showCode;
  bool _typeCode;

  Widget _cardIcon({String title, IconData icon}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey[300])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 64.0),
          SizedBox(height: 16.0),
          Text(title, style: Theme.of(widget.context).textTheme.subtitle),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      height: 60.0,
      color: Theme.of(widget.context).primaryColor,
      child: Center(
          child: Text(
        'Obtener código',
        style: Theme.of(widget.context)
            .textTheme
            .title
            .copyWith(color: Colors.white),
      )),
    );
  }

  Widget _codeImage(bool qr) {
    return SizedBox(
      child: Center(
        child: qr
            ? QrImage(
                size: 150.0,
                data: _generateContent(),
                foregroundColor: Color(0xff03291c),
              )
            : BarCodeImage(
                params: Code39BarCodeParams(
                  widget.insume.id,
                  lineWidth: 2.0,
                  barHeight: 150.0,
                ),
                onError: (error) => print('error = $error'),
              ),
      ),
    );
  }

  String _generateContent() {
    return ("producto|${widget.insume.id}|${widget.insume.nombre}|${widget.insume.precio}|${widget.insume.fechaVen}|${widget.insume.tipo}|${widget.insume.descripcion}");
  }

  @override
  void initState() {
    super.initState();
    _showCode = false;
    _typeCode = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _title(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: !_showCode
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() {
                            _showCode = true;
                            _typeCode = false;
                          }),
                          child: _cardIcon(
                              icon: constant.iconsUser['bar_code'],
                              title: 'Bar Code'),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                          child: InkWell(
                        onTap: () => setState(() {
                          _showCode = true;
                          _typeCode = true;
                        }),
                        child: _cardIcon(
                            icon: constant.iconsUser['qr_code'],
                            title: 'QR Code'),
                      )),
                    ],
                  )
                : _codeImage(_typeCode),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              child: Text(
                'Descargar',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                //TODO: descargar
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        )
      ],
    );
  }
}
