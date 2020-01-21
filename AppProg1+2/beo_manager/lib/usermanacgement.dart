import 'package:flutter/material.dart';
import './beoproducts.dart';
import './myproducts.dart';

class UserManagementPage extends State<UserManagement> {
  List<BeoProduct> myProducts;
  UserManagementPage(this.myProducts);
  List<Widget> _pages = [
    ProductPage(),
    ProductPage(),
    UserManagement()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User management'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: tippyTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location),
            title: Text('Locations'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text('Profiles'))
        ],
      ),
      body: Container(),
    );
  }
  void tippyTapped(int index) {
    setState(() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _pages[index]));
    });
  }
}

class UserManagement extends StatefulWidget {
  final List<BeoProduct> myProducts;
  UserManagement({this.myProducts});
  UserManagementPage createState() => UserManagementPage(myProducts);
}