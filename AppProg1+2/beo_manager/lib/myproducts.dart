import 'package:flutter/material.dart';

import './beoproducts.dart';
import './usermanacgement.dart';
  

  class BeoProductPage extends State<ProductPage> {
  List<Widget> _pages = [ProductPage(), ProductPage(), UserManagement()];
  BeoProducts beoProducts = new BeoProducts();
  List<BeoProduct> myProducts = new List<BeoProduct>();
  
  void productControl(index) {
    showDialog(context: context, child:
    new Dialog(
      child: Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(myProducts[index].thumbnail)),
            Text(myProducts[index].productName),
            Icon(Icons.skip_previous),
            Icon(Icons.play_arrow),
            Icon(Icons.pause),
            Icon(Icons.skip_next)
          ],
        ),
      )
    )
    );
  }

  Widget _buildProductList() {
    

    return ListView.builder(
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(myProducts[index].name),
          leading: CircleAvatar(
            backgroundImage: AssetImage(myProducts[index].thumbnail),
          ),
          onTap: () {productControl(index);}
        );
      },
    );
  }

  bool _checkIfProductSelected(index) {
    for (var p in myProducts) {
      if (p.name == beoProducts.products[index].name) {
        return true;
      }
    }
    return false;
  }

  void _pushAddProductScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Add/Remove Devices"),
                ),
            body: ListView.builder(
              itemCount: beoProducts.products.length,
              itemBuilder: (context, index) {
                final bool alreadyAdded = _checkIfProductSelected(index);
                return ListTile(
                  title: Text(beoProducts.products[index].name),
                  trailing: Icon(alreadyAdded
                      ? Icons.check_circle
                      : Icons.check_circle_outline),
                  onTap: () {
                    setState(() {
                      bool alreadyAdded = _checkIfProductSelected(index);
                      if (alreadyAdded) {
                        myProducts.remove(myProducts.singleWhere(
                            (e) => e.name == beoProducts.products[index].name));
                      } else {
                        myProducts.add(new BeoProduct(
                            beoProducts.products[index].name,
                            beoProducts.products[index].type,
                            beoProducts.products[index].thumbnail));
                      }
                    });
                  },
                );
              },
            ));
      });
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tippyTapped),
        currentIndex: 0,
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
      appBar: AppBar(
        title: Text('Beomanager - Casper H4'),
        leading: Image.asset('./assets/beologo.png'),
      ),
      body: _buildProductList(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _pushAddProductScreen,
          icon: Icon(Icons.music_note),
          backgroundColor: Colors.teal,
          label: Text("Discovered Devices")),
    );
  }

  void tippyTapped(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _pages[index]));
  }
}

class ProductPage extends StatefulWidget {
  BeoProductPage createState() => BeoProductPage();
}
