import 'package:learning_flutter/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {
  List<Product> _products = [];

  int _slectedProductIndex;

  int get slectedProductIndex {
    return _slectedProductIndex;
  }
  Product get slectedProduct{
    if(_slectedProductIndex == null){
      return null;
    }
    return _products[_slectedProductIndex];
  }

  List<Product> get products => List.from(_products);

  void addProduct(Product product) {
    _products.add(product);
    _slectedProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_slectedProductIndex] = product;
    _slectedProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_slectedProductIndex);
    _slectedProductIndex = null;
  }

  void selectProduct(int index) {
    _slectedProductIndex = index;
  }

}
