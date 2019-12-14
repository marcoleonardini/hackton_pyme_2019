import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/models/insume.dart';
import 'package:hackaton_pyme_2019/ui/pages/productDetail/product_detail_screen.dart';

class CardViewProduct extends StatelessWidget {
  final Insume product;
  CardViewProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(3.0, 3.0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Center(
                    child: Text(
              product.nombre,
              style: Theme.of(context).textTheme.body1,
            ))),
            Column(
              children: <Widget>[
                Text("${product.precio}\t\$",
                    style: Theme.of(context).textTheme.body2),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "cantidad:\t",style: Theme.of(context).textTheme.body2),
                    TextSpan(
                        text: "${product.cantidad}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color:
                                product.cantidad < 10 ? Colors.red : Colors.grey))
                  ]),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        if(product.nombre == 'Amortiguador') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(
            image: 'assets/amortiguadores.jpg',
            name: 'Amortiguador',
            price: '65.0',
            quantity: '98',
          )));
        }
        if(product.nombre == 'Rodamientos') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(
            image: 'assets/rodamientos.jpeg',
            name: 'Rodamientos',
            price: '30.0',
            quantity: '15',
          )));
        }
        if(product.nombre == 'Filtros') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(
            image: 'assets/filtros.jpeg',
            name: 'Amortiguador',
            price: '15.0',
            quantity: '5',
          )));
        }
      },
    );
  }
}
