import 'package:flutter/material.dart';

class MyFieldForm extends StatelessWidget {
  String _title;
  bool _isPassword = false;
  MyFieldForm(this._title, this._isPassword);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              obscureText: _isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
            ),
          )
        ],
      ),
    );
  }
}
