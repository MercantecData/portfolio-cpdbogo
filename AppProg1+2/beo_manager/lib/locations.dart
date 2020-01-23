import 'package:flutter/material.dart';

import 'beoproducts.dart';
import 'main.dart';

class LocationsPage extends State<Locations> {
  TextEditingController _textFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiroom Setup'),
      ),
      body: ListView.builder(
          itemCount: myLocations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myLocations[index].name),
              onTap: () {
                addDevices(index);
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: myLocations[index].getAvatars(),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (addRoom),
          icon: Icon(Icons.my_location),
          backgroundColor: Colors.teal,
          label: Text("Add Room")),
    );
  }

  void addDevices(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setStatee) {
          return SimpleDialog(
            title: Text(myLocations[index].name),
            children: <Widget>[
              Container(
                  height: 300.0,
                  width: 300.0,
                  child: ListView.builder(
                      itemCount: myProducts.length,
                      itemBuilder: (context, indexx) {
                        final bool alreadyAdded = myLocations[index]
                            .products
                            .contains(myProducts[indexx]);
                        return ListTile(
                          title: Text(myProducts[indexx].name),
                          trailing: Icon(alreadyAdded
                              ? Icons.check_circle
                              : Icons.check_circle_outline),
                          onTap: () {
                            setState(
                              () {
                                // myLocations[index].products.add(myProducts[indexx]);

                                bool alreadyAdded = myLocations[index]
                                    .products
                                    .contains(myProducts[indexx]);
                                if (alreadyAdded) {
                                  myLocations[index].products.remove(
                                      myLocations[index].products.singleWhere(
                                          (e) =>
                                              e.name ==
                                              myProducts[indexx].name));
                                } else {
                                  myLocations[index]
                                      .products
                                      .add(myProducts[indexx]);
                                }
                              },
                            );
                          },
                        );
                      }))
            ],
          );
        });
      },
    );
  }

  void addRoom() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a room'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Add a room"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Add'),
                onPressed: () {
                  setState(() {
                    myLocations.add(new Location(_textFieldController.text));
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class Locations extends StatefulWidget {
  LocationsPage createState() => LocationsPage();
}

class Location {
  String name;
  List<BeoProduct> products = [];

  List<Widget> getAvatars() {
    List<Widget> tempwidget = new List<Widget>();
    if (this.products != null) {
      for (var product in this.products) {
        tempwidget
            .add(CircleAvatar(backgroundImage: AssetImage(product.thumbnail)));
      }
      return tempwidget;
    }
    tempwidget.add(Container());
    return tempwidget;
  }

  Location(String name) {
    this.name = name;
  }
}
