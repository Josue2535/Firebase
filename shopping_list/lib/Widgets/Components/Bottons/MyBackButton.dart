import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_list/Utils/TextApp.dart';

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            Text(
              TextApp.BACK,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
