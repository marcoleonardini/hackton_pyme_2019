import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_button.dart';
import 'package:hackaton_pyme_2019/ui/widgets/custom_input_field.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final String quantity;
  final String price;

  ProductDetailScreen({this.name, this.image, this.quantity, this.price});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController addQuantityController = new TextEditingController();
  TextEditingController minusQuantityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.black),
        ),
        brightness: Brightness.light,
        title: Text(this.widget.name, style: Theme.of(context).textTheme.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: Container(
                      height: 250.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(this.widget.image))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: <Widget>[
                      CustomButton(
                        backgroundColor: Colors.white,
                        child: Text("Reducir"),
                        icon: Icon(Icons.remove),
                        textColor: Colors.black,
                        onPressed: () {
                          _showMinusDialog(context);
                        },
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 20.0,
                        ),
                      ),
                      CustomButton(
                        backgroundColor: Colors.white,
                        child: Text("Añadir"),
                        icon: Icon(Icons.add),
                        textColor: Colors.black,
                        onPressed: () {
                          _showAddDialog(context);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  dualText("Nombre:", this.widget.name, context),
                  SizedBox(
                    height: 30.0,
                  ),
                  dualText("Precio:", this.widget.price + ".Bs", context),
                  SizedBox(
                    height: 30.0,
                  ),
                  dualText("Cantidad:", this.widget.quantity, context),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget dualText(String title, String content, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(content, style: Theme.of(context).textTheme.body1)
      ],
    );
  }

  void _showAddDialog(context) {
    showDialog(
        context: context,
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: CustomInputField(
                  getText: (String text) => setState(() {
                    //TODO: averiguar data
                  }),
                  controller: addQuantityController,
                  hintText: 'Añadir productos',
                  labelText: 'Añadir productos',
                  icon: Icon(Icons.add),
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () {
                print("Add");
              },
              child: Text("Añadir"),
            ),
          ],
        ));
  }

  void _showMinusDialog(context) {
    showDialog(
        context: context,
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          content: Container(
            padding: EdgeInsets.all(10.0),
            child: CustomInputField(
              getText: (String text) => setState(() {
                //TODO: averiguar data
              }),
              controller: addQuantityController,
              hintText: 'Reducir Productos',
              labelText: 'Reducir productos',
              icon: Icon(Icons.remove),
              inputType: TextInputType.number,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () {
                print("Minus");
              },
              child: Text("Reducir"),
            ),
          ],
        ));
  }
}
