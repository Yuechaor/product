import 'package:flutter/material.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/pages/product_create.dart';
import 'package:learning_flutter/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class MyProductPage extends StatelessWidget {
  // final List<Product> _products;
  // final Function _updateProduct;
  // final Function _deleteProduct;
  // MyProductPage(this._products, this._updateProduct, this._deleteProduct);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductModel>(
      builder: (context, child, model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.products[index].title),
              //direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct();
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
                      backgroundImage: AssetImage(model.products[index].image),
                    ),
                    //Icon(Icons.face),
                    title: Text(model.products[index].title),
                    subtitle:
                        Text("AU\$${model.products[index].price.toString()}"),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                      onPressed: () {
                        model.selectProduct(index);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return CreateProductPage();
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
          itemCount: model.products.length,
        );
      },
    );
  }
}
