import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Components/Bottons/MyBackButton.dart';
import 'package:shopping_list/Widgets/Components/Bottons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Components/Bottons/mySignUpLabelButton.dart';
import 'package:shopping_list/Widgets/Components/Containers/containerShape01.dart';
import 'package:shopping_list/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shopping_list/Widgets/designAssets.dart';

import 'loginSCreen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _emailPasswordWidget() {
    var USER_NAME;
    return Column(
      children: <Widget>[
        MyFieldForm(TextApp.USER_NAME, false),
        MyFieldForm(TextApp.EMAIL_ID, false),
        MyFieldForm(TextApp.PASSWORD, true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ContainerShape01(),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * .15), //15%
                    child: DesignWidget.darkTittleCustom(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * .05), //5%
                    child: _emailPasswordWidget(),
                  ),
                  MyLoginButon(TextApp.SINGUP, Colors.white,
                      Theme.of(context).primaryColorDark, LoginScreen()),
                  MySignUpLabelButton(
                    TextApp.I_HAVE_ACCOUNT,
                    TextApp.LOGIN,
                    Theme.of(context).primaryColorDark,
                    LoginScreen(),
                  )
                ],
              ),
            ),
          ),

          Positioned(top: height * .025, child: MyBackButton()), //2,5%
        ],
      ),
    ));
  }
}
