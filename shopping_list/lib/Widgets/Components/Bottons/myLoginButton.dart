import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/Utils/TextApp.dart';

class MyLoginButon extends StatelessWidget {
  String _text;
  Color _colorText;
  Color _colorButtonBackGround;
  Widget _widgetToNavigate;
  MyLoginButon(this._text, this._colorText, this._colorButtonBackGround,
      this._widgetToNavigate);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0, bottom: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => _widgetToNavigate)),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: _colorButtonBackGround,
        child: Text(
          _text,
          style: TextStyle(
              color: _colorText,
              letterSpacing: 1.5,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
