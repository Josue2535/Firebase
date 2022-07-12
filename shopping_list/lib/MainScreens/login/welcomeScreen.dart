import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/MainScreens/login/signUp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Components/Bottons/myLoginButton.dart';
import 'package:shopping_list/Widgets/designAssets.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

Widget _singUpButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: OutlinedButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp())),
      child: Text(
        TextApp.SINGUP,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: DesignWidget.linearGradientMain(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesignWidget.tittleCustom(),
                MyLoginButon(TextApp.LOGIN, Theme.of(context).primaryColorDark,
                    Colors.white, LoginScreen()),
                _singUpButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
