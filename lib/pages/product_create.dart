import 'package:flutter/material.dart';
import 'package:learning_flutter/models/product.dart';
import 'package:learning_flutter/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateProductPage extends StatefulWidget {
  // final Function addProduct;
  // final Product product;
  // final Function updateProduct;
  // final int productIndex;
  // CreateProductPage(
  //     {this.addProduct, this.updateProduct, this.product, this.productIndex});
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final Map<String, dynamic> _createFormData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildProductTitle(Product slectedProduct) {
    return TextFormField(
      //autovalidate: true,
      initialValue: slectedProduct == null ? '' : slectedProduct.title,
      validator: (String value) {
        //if(value.trim().length <= 0){
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and must be 5+ letters';
        }
      },
      decoration: InputDecoration(
          labelText: 'Product Title', prefixIcon: Icon(Icons.content_paste)),
      onSaved: (String value) {
        _createFormData['title'] = value;
      },
    );
  }

  Widget _buildProductDecription(Product slectedProduct) {
    return TextFormField(
      initialValue: slectedProduct == null ? '' : slectedProduct.description,
      validator: (String value) {
        //if(value.trim().length <= 0){
        if (value.isEmpty || value.length < 5) {
          return 'description is required and must be 5+ letters';
        }
      },
      decoration: InputDecoration(
          labelText: 'Description', prefixIcon: Icon(Icons.create)),
      maxLines: 5,
      onSaved: (String value) {
        _createFormData['description'] = value;
      },
    );
  }

  Widget _buildProductPrice(Product slectedProduct) {
    return TextFormField(
      initialValue:
          slectedProduct == null ? '' : slectedProduct.price.toString(),
      validator: (String value) {
        //if(value.trim().length <= 0){
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'price is required and should be a number';
        }
      },
      decoration: InputDecoration(
          labelText: 'Price', prefixIcon: Icon(Icons.monetization_on)),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _createFormData['price'] = double.parse(value);
      },
    );
  }

  void _submitCreateProductForm(Function addProduct, Function updateProduct, [int slectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    if (slectedProductIndex == null) {
      addProduct(Product(
          title: _createFormData['title'],
          description: _createFormData['description'],
          price: _createFormData['price'],
          image: _createFormData['image']));
    } else {
      updateProduct(
          Product(
              title: _createFormData['title'],
              description: _createFormData['description'],
              price: _createFormData['price'],
              image: _createFormData['image']));
    }

    Navigator.pushReplacementNamed(context, '/list');
  }

  Widget _createPage(BuildContext context, Product slectedProduct) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double adjustedWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    final double adjustedPadding = deviceWidth - adjustedWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: adjustedPadding / 2),
            children: <Widget>[
              //first input box
              _buildProductTitle(slectedProduct),
              //second input box
              _buildProductDecription(slectedProduct),
              //third input box
              _buildProductPrice(slectedProduct),
              SizedBox(
                height: 10,
              ),
              _buildSaveButton()
              // GestureDetector(
              //   onTap: _submitCreateProductForm,
              //   child: Container(
              //     child: Text('mybutton'),
              //     color: Colors.deepOrange,
              //     padding: EdgeInsets.all(10),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

// scope model build in the save button
  Widget _buildSaveButton() {
    return ScopedModelDescendant<ProductModel>(
      builder: (context, child, model) {
        return RaisedButton(
          child: Text(
            'save',
            style: TextStyle(fontSize: 25),
          ),
          color: Colors.deepOrange,
          textColor: Colors.white,
          onPressed: () =>
              _submitCreateProductForm(model.addProduct, model.updateProduct, model.slectedProductIndex),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return ScopedModelDescendant<ProductModel>(
      builder: (context, child, model) {
        final Widget createPage = _createPage(context,model.slectedProduct);
        return model.slectedProductIndex == null
            ? createPage
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Product'),
                ),
                body: createPage,
              );
      },
    );
  }
}
