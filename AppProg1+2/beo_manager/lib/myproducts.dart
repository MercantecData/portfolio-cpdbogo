import 'package:flutter/material.dart';

import './beoproducts.dart';

class BeoProductPage extends State<ProductPage> {
  BeoProducts beoProducts = new BeoProducts();
  List<BeoProduct> myProducts = new List<BeoProduct>();

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(myProducts[index].name),
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
          appBar: AppBar(title: Text("Add/Remove Devices"), leading: Image.asset('./assets/beologo.png')),
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
                          beoProducts.products[index].type));
                    }
                  });
                },
              );
            },
          )
        )
        ;
      });
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beomanager - Casper H4'),leading: Image.asset('./assets/beologo.png'),),
      body: _buildProductList(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _pushAddProductScreen,
          icon: Icon(Icons.speaker),
          backgroundColor: Colors.teal,
          label: Text("Add/Remove device")),
    );
  }
}

class ProductPage extends StatefulWidget {
  BeoProductPage createState() => BeoProductPage();
}
