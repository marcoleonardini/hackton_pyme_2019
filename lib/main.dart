import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackaton_pyme_2019/ui/pages/efective/efective.dart';
import 'package:hackaton_pyme_2019/ui/pages/incomes/incomes.dart';
import 'package:hackaton_pyme_2019/ui/pages/productDetail/product_detail_screen.dart';
import 'package:hackaton_pyme_2019/ui/pages/providers/providers.dart';
import 'package:hackaton_pyme_2019/ui/pages/sales/sales.dart';
import 'ui/pages/home.page.dart';
import 'ui/pages/inventory/inventory.dart';
import 'ui/pages/productForm/product_form_screen.dart';
import 'ui/pages/insumeForm/insume_form_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              display1: TextStyle(
                fontSize: 28,
                fontFamily: 'PatrickHand',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              display2: TextStyle(
                fontSize: 16,
                fontFamily: 'PatrickHand',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              display3: TextStyle(
                fontSize: 12,
                // fontFamily: 'PatrickHand',
                color: Colors.black87,
                // fontWeight: FontWeight.bold,
              ),
              subtitle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300),
              body2: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              title: TextStyle(
                  fontFamily: 'PatrickHand',
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0))),
      routes: {
        '/': (context) => HomePage(),
        'inventory': (context) => Inventory(),
        'efective': (context) => Efective(),
        'sales': (context) => SalesScreen(),
        'incomes': (context) => IncomesScreen(),
        'productForm': (context) => ProductFormScreen(),
        'insumeForm': (context) => InsumeFormScreen(),
        'productDetail': (context) => ProductDetailScreen(),
        'providers':(context)=> Providers()
      },
    );
  }
}
