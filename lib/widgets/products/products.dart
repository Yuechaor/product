import 'package:flutter/material.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/scoped_models/products.dart';
import 'package:learning_flutter/widgets/products/product_card.dart';
import 'package:scoped_model/scoped_model.dart';

class Products extends StatelessWidget {

 Widget _buildProductList(List<Product> products) {
    Widget productCards;
    if (products.length > 0) {
      print('zhi xing');
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(products[index], index);
        },
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
     print(productCards);
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    
    return ScopedModelDescendant<ProductModel>(builder: (context,child, model ){
       return _buildProductList(model.products);
    },);
    
   
  }
}

