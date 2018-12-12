import 'package:flutter/material.dart';

import 'package:learning_flutter/widgets/products/products.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            title: Text('Edit Products'),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite, size: 30),
            color: Colors.white,
            onPressed: () {
              print('go to user faverate product list');
            },
          )
        ],
      ),
      body: Products(),
    );
  }
}
