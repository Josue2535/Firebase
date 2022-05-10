import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScrean.dart';
import 'package:shopping_list/MainScreens/login/loginSCreen.dart';
import 'package:shopping_list/MainScreens/login/signUp.dart';
import 'package:shopping_list/Utils/loginPhoneUtils.dart';
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

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState(user: user);
}

_drawerHome(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        //Drawer

        //cerrar sesión
        ListTile(
          onTap: () => {
            LoginPhoneUtils.signOut(),
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            )
          },
          leading: Icon(Icons.logout),
          title: Text(
            TextApp.LOGOUT,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  final User user;

  _HomeScreenState({required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "You are Logged in succesfully",
                style: TextStyle(color: Colors.lightBlue, fontSize: 32),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "${user.phoneNumber}",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        drawer: _drawerHome(context));
  }
}
