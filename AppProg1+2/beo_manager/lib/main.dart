import 'package:beo_manager/locations.dart';
import 'package:flutter/material.dart';


import './myproducts.dart';
import 'beoproducts.dart';

List<BeoProduct> myProducts = new List<BeoProduct>();
List<Location> myLocations = new List<Location>();
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

