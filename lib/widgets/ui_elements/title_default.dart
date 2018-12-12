import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String _title;
  TitleDefault(this._title){
    print('title default is on');
    print(_title);
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 40, fontFamily: 'rmit'),
    );
  }
}
