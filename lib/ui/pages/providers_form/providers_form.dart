import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_button.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_input_field.dart';

class ProvidersForm extends StatelessWidget {
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
        title: Text("Añade un nuevo proveedor",
            style: Theme.of(context).textTheme.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  String _name = 'name';
  int _number;
  String _description;

  TextEditingController _controllerName;
  TextEditingController _controllerNumber;
  TextEditingController _controllerDescription;

  Widget _avatarName() {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(_name.length > 0 ? _name[0].toUpperCase() : 'N',
            style: TextStyle(color: Colors.white, fontSize: 32.0)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controllerDescription = TextEditingController();
    _controllerName = TextEditingController();
    _controllerNumber = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _avatarName(),
            SizedBox(height: 32.0),
            Text('Adicione la información del contacto',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 8.0),
            CustomInputField(
              getText: (String text) => setState(() => _name = text),
              controller: _controllerName,
              labelText: 'Nombre',
              hintText: 'Introduzca el nombre del proveedor',
              icon: Icon(Icons.person),
              inputType: TextInputType.text,
            ),
            SizedBox(height: 8.0),
            CustomInputField(
              getText: (String text) =>
                  setState(() => _number = int.parse(text)),
              controller: _controllerNumber,
              labelText: 'Número de contacto',
              hintText: 'Introduzca el número (telf) del proveedor',
              icon: Icon(Icons.call),
              inputType: TextInputType.number,
            ),
            SizedBox(height: 8.0),
            CustomInputField(
              getText: (String text) => setState(() => _description = text),
              controller: _controllerDescription,
              labelText: 'Descripción',
              hintText: 'Introduzca alguna descripción',
              icon: Icon(Icons.description),
              inputType: TextInputType.text,
            ),
            SizedBox(height: 32.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                child: Text("Guardar"),
                icon: Icon(Icons.save),
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                onPressed: () {
                  //TODO: send and save new item
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
