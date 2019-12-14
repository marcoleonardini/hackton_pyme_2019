import 'package:hackaton_pyme_2019/models/movement.dart';

List<Movement> listMovements = [
  _movement1,
  _movement2,
  _movement3,
  _movement4,
  _movement5
];

Movement _movement1 = Movement(
    name: '50 cajas tornillos',
    date: '15 de mayo del 2019',
    income: true,
    sales: 260.0);

Movement _movement2 = Movement(
    name: '2 soldaroras marca hix',
    date: '20 de junio del 2019',
    income: false,
    sales: 1590.0);

Movement _movement3 = Movement(
    name: '3 amortiguadores',
    date: '19 de julio del 2019',
    income: true,
    sales: 875.0);

Movement _movement4 = Movement(
    name: '1 motor de motocicleta',
    date: '08 de agosto del 2019',
    income: true,
    sales: 570.0);

Movement _movement5 = Movement(
    name: '2 cajas de filtros',
    date: '15 de mayo del 2019',
    income: false,
    sales: 640.0);
