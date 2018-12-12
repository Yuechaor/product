import 'package:flutter/material.dart';

class AdressTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.9),
      padding: EdgeInsets.all(15),
      child: Text('179 station street, burwood, melbourne, AU'),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
