import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScrean.dart';
import 'package:shopping_list/MainScreens/login/loginSCreen.dart';
import 'package:shopping_list/MainScreens/login/signUp.dart';
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
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

_drawerHome(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        //Drawer
        DrawerHeader(
            decoration: BoxDecoration(
              gradient: DesignWidget.linearGradientMain(context),
            ),
            child: CircleAvatar(
                radius: 10,
                child: Image(
                  image: NetworkImage(
                      LoginGoogleUtils.getUserGoogle()!.photoUrl.toString()),
                ))),
        //cerrar sesión
        ListTile(
          onTap: () => {
            LoginGoogleUtils.signInWithGoogle(context: context),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: Center(), drawer: _drawerHome(context));
  }
}
