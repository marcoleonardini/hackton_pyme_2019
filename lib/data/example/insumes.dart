import 'dart:async';

import 'package:hackaton_pyme_2019/models/insume.dart';

List<Insume> products = [_product1, _product2, _product3];

Future<List<Insume>> getProducts() {
  return Future.delayed(Duration(milliseconds: 1500))
      .then((onValue) => products);
}

Insume _product1 = Insume(
    nombre: 'Amortiguador',
    id: '231sa8s',
    cantidad: 98,
    fechaComp: '04/06/19',
    precio: 65.0,
    proveedor: 'La cerradura srl');

Insume _product2 = Insume(
    nombre: 'Rodamientos',
    id: '34skl3',
    cantidad: 15,
    fechaComp: '16/07/19',
    precio: 30.0,
    proveedor: 'El tio salqui');

Insume _product3 = Insume(
  nombre: 'Filtros',
  id: '592ns2',
  cantidad: 5,
  fechaComp: '20/07/19',
  precio: 15.0,
);
