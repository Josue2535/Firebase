import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MySignUpLabelButton extends StatelessWidget {
  final String _firstText;
  final String _secondText;
  final Color _secondTextColor;
  final Widget _widgetToNavigate;
  MySignUpLabelButton(this._firstText, this._secondText, this._secondTextColor,
      this._widgetToNavigate);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => _widgetToNavigate)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _firstText,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              _secondText,
              style: TextStyle(
                  color: _secondTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
