import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScrean.dart';
import 'package:shopping_list/MainScreens/login/welcomeScreen.dart';
import 'package:shopping_list/Utils/ConstantsApp.dart';
import 'dart:developer' as developer;

import 'package:shopping_list/Utils/analythics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff22b50),
        primaryColorDark: Color(0xff050028),
        primaryColorLight: Color(0xff57547c),
        accentColor: Color(0xffedecee),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _initializationFirebase = Firebase.initializeApp();
  static const String TAG = 'Main';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializationFirebase,
        builder: (context, snapshot) {
          //check for errorrs
          if (snapshot.hasError) {
            developer.log(TAG + ", Firebase init ERROR");
            return SnackBar(content: Text('error inicializando firebase'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            developer.log(TAG + ", Firebase init");
            Analythics().logPostCreated();
            return WelcomeScreen();
          }
          return CircularProgressIndicator();
        });
  }
}
