import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_button.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_input_field.dart';

class InsumeFormScreen extends StatefulWidget {
  @override
  _InsumeFormScreenState createState() => _InsumeFormScreenState();
}

class _InsumeFormScreenState extends State<InsumeFormScreen> {
  
  TextEditingController _nameController;
  TextEditingController _quantityController;
  TextEditingController _priceController;
  TextEditingController _typeController;
  TextEditingController _providerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController();
    _quantityController = new TextEditingController();
    _priceController = new TextEditingController();
    _typeController = new TextEditingController();
    _providerController = new TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añade un nuevo insumo"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 140.0,
              width: 140.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 4.0
                ),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Center(child: Text("Imagen no seleccionada")),
            ),
            SizedBox(height: 20.0),
            CustomButton(
              child: Text("Selecciona una imagen"),
              icon: Icon(Icons.image),
              textColor: Colors.white,
              backgroundColor: Colors.blue,
              onPressed: () {},
            ),
            SizedBox(height: 10.0,),
            CustomInputField(
              controller: _nameController,
              hintText: 'Ingresa el nombre del insumo',
              labelText: 'Nombre',
              icon: Icon(Icons.shopping_cart),
              inputType: TextInputType.text,
            ),
            SizedBox(height: 10.0,),
            CustomInputField(
              controller: _quantityController,
              hintText: 'Ingresa la cantidad del insumo',
              labelText: 'Cantidad',
              icon: Icon(Icons.show_chart),
              inputType: TextInputType.number,
            ),
            SizedBox(height: 10.0,),
            CustomInputField(
              controller: _typeController,
              hintText: 'Ingresa el tipo del insumo',
              labelText: 'Tipo',
              icon: Icon(Icons.sort),
              inputType: TextInputType.text,
            ),
            SizedBox(height: 10.0,),
            CustomInputField(
              controller: _providerController,
              hintText: 'Ingresa el proveedor del insumo',
              labelText: 'Proovedor',
              icon: Icon(Icons.people),
              inputType: TextInputType.text,
            ),
            SizedBox(height: 20.0,),
            CustomButton(
              child: Text("Guardar"),
              icon: Icon(Icons.save),
              textColor: Colors.white,
              backgroundColor: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      )
    );
  }
}