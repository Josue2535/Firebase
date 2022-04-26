import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScrean.dart';
import 'package:shopping_list/MainScreens/login/signUp.dart';
import 'package:shopping_list/Utils/analythics.dart';
import 'package:shopping_list/Widgets/Components/Bottons/MyBackButton.dart';
import 'package:shopping_list/Widgets/Components/Bottons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Components/Containers/ContainerShape01.dart';
import 'package:shopping_list/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shopping_list/Widgets/designAssets.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;
import 'dart:math';
import '../../Utils/TextApp.dart';
import '../../Utils/loginGoogleUtils.dart';
import '../../Widgets/Components/Bottons/mySignUpLabelButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        MyFieldForm(TextApp.EMAIL_ID, false),
        MyFieldForm(TextApp.PASSWORD, true)
      ],
    );
  }

  Widget _forgottenPassword() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: Text(
        TextApp.FORGOT_PASSWORD,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(TextApp.OR),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
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
          Positioned(
            top: height * .025,
            child: MyBackButton(),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * .15),
                  child: DesignWidget.darkTittleCustom(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * .05),
                  child: _emailPasswordWidget(),
                ),
                MyLoginButon(TextApp.LOGIN, Colors.white,
                    Theme.of(context).primaryColorDark, HomeScreen()),
                _forgottenPassword(),
                _divider(),
                Center(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: GoogleAuthButton(
                      text: TextApp.GOOGLE_SIGN,
                      onPressed: () async {
                        User? user = await LoginGoogleUtils.signInWithGoogle(
                            context: context);
                        print(user?.displayName);
                        if (user != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                Analythics().logPostCreated();
                                return HomeScreen();
                              },
                            ),
                          );
                        }
                      },
                      darkMode: false,
                    ),
                  ),
                ),
                MySignUpLabelButton(
                  TextApp.DONT_HAVE_ACCOUNT,
                  TextApp.SINGUP,
                  Theme.of(context).primaryColorDark,
                  SignUp(),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
