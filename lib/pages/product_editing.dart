import 'package:flutter/material.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/pages/product_create.dart';
import 'package:learning_flutter/pages/product_list.dart';
import 'package:learning_flutter/pages/product_my_product.dart';

class ProductEditing extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
              child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('Product List'),
                leading: Icon(Icons.shop),
                onTap: () {
                 Navigator.pushReplacementNamed(context, '/list');
                },
              )
            ],
          )),
          appBar: AppBar(
            title: Text('Edit Your product'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(
                  text: 'My product',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[CreateProductPage(), MyProductPage()],
          )),
    );
  }
}
