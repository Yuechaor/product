import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final double _price;

  PriceTag(this._price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Text(
        _price.toString(),
        style: TextStyle(fontSize: 24),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
