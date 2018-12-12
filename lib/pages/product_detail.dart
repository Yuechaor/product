import 'package:flutter/material.dart';
import 'package:learning_flutter/widgets/products/adress_tag.dart';
import 'package:learning_flutter/widgets/ui_elements/title_default.dart';

class ProductDetailPage extends StatelessWidget {
  final String _title;
  final String _imageUrl;
  final double _price;
  final String _description;

  ProductDetailPage(
      this._title, this._imageUrl, this._description, this._price);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false); //  在这里可以控制页面pop之后传递的布尔值
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(_imageUrl),
              Container(
                margin: EdgeInsets.only(top: 20.9),
                child: TitleDefault(_title),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.9),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AdressTag(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          '|',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 30),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(
                          '\$${_price.toString()}',
                          style: TextStyle(fontSize: 24),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.9),
                padding: EdgeInsets.all(15),
                child: Text(
                  _description,
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
              ),

              //show Worning Dialog!
              // RaisedButton(
              //   child: Text('Back'),
              //   onPressed: () => showWorningDialog(context),
              // )
            ],
          ),
        ));
  }

  // showWorningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           title: Text('are you sure?'),
  //           content: Text('this action cannot be undone'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('DISCARD'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('CONTINUE'),
  //               onPressed: () {
  //                 Navigator.pop(context); // fisrt pop only close the overlay,
  //                 Navigator.pop(
  //                     context, true); // second pop will close the page
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
