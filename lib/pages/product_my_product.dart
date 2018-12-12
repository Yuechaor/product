import 'package:flutter/material.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/pages/product_create.dart';

class MyProductPage extends StatelessWidget {
  final List<Product> _products;
  final Function _updateProduct;
  final Function _deleteProduct;
  MyProductPage(this._products, this._updateProduct, this._deleteProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(_products[index].title),
          //direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              _deleteProduct(index);
            }
          },
          background: Container(
            //padding: EdgeInsets.symmetric(vertical: 0),
            color: Colors.red,
          ),

          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(10),
                //leading: Image.asset(_products[index]['image']),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(_products[index].image),
                ),
                //Icon(Icons.face),
                title: Text(_products[index].title),
                subtitle: Text("AU\$${_products[index].price.toString()}"),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return CreateProductPage(
                              product: _products[index],
                              updateProduct: _updateProduct,
                              productIndex: index);
                        },
                      ),
                    );
                    print('edit product clcked!');
                  },
                ),
              ),
              Divider(
                // height: 10,
                color: Colors.deepOrange,
              ),
            ],
          ),
        );
      },
      itemCount: _products.length,
    );
  }
}
