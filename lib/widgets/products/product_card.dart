import 'package:flutter/material.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/scoped_models/products.dart';
import 'package:learning_flutter/widgets/products/adress_tag.dart';
import 'package:learning_flutter/widgets/products/price.dart';
import 'package:learning_flutter/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final Product _product;
  final int _index;
  ProductCard(this._product, this._index) {
    print('card is on');
    print(_product.title);
    print(_index);
  }
  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(_product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(_product.price)
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + _index.toString()),
        ),
        ScopedModelDescendant<ProductModel>(builder: (context, child, model) {
          return IconButton(
            icon: Icon(model.products[_index].favouriteOrNot
                ? Icons.favorite
                : Icons.favorite_border),
            color: Colors.red,
            onPressed: () {
              model.selectProduct(_index);
              model.toggleFavouriteStatus();
            },
          );
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_product.image),
          _buildTitlePriceRow(),
          AdressTag(),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
