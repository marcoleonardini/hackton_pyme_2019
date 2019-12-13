import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackaton_pyme_2019/ui/pages/inventory/inventory.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              body1: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w300),
              body2: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 16.0),
              title: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0))),
      home: Inventory(),
    );
  }
}
