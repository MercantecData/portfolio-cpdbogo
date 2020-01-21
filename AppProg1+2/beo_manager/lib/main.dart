import 'package:flutter/material.dart';


import './myproducts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.teal),
      darkTheme: ThemeData(brightness: Brightness.dark),
      title: 'Casper H4 Project',
      home: ProductPage(),
    );
  }
}

