import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Utils/analythics.dart';
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

final CollectionReference _users =
    FirebaseFirestore.instance.collection('users');
final _email = TextEditingController();
final _nameUser = TextEditingController();
final _phone = TextEditingController();
bool isChecked = false;

class _SignUpState extends State<SignUp> {
  Widget _emailPasswordWidget() {
    var USER_NAME;
    return Column(
      children: <Widget>[
        MyFieldForm(TextApp.USER_NAME, false, _nameUser, TextInputType.name),
        MyFieldForm(
            TextApp.EMAIL_ID, false, _email, TextInputType.emailAddress),
        MyFieldForm(TextApp.PHONE, false, _phone, TextInputType.phone),
        SizedBox(
          width: 10,
        ), //SizedBox
        Text(
          'Terminos y condiciones ',
          style: TextStyle(fontSize: 17.0),
        ), //Text
        SizedBox(width: 10), //SizedBox
        /** Checkbox Widget **/
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
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
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                        child: Text("Registrarse"),
                        textColor: Colors.blue,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          final phone = _phone.text.trim();
                          final email = _email.text.trim();
                          final name = _nameUser.text.trim();
                          if (!Analythics.emailChek(email)) {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title:
                                    const Text("El email no esta bien escrito"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: Colors.green,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          if (!Analythics.nameChek(name)) {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                    "El nombre no está bien escrito"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: Colors.green,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          if (!Analythics.phoneChek(phone)) {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                    "El numero no está bien escrito"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: Colors.green,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          if (isChecked != false) {
                            if (email != "" && phone != "" && name != "") {
                              _users
                                  .doc(phone)
                                  .set({
                                    "id": phone,
                                    'full_name': name, // John Doe
                                    'email': email, // Stokes and Sons
                                    'phone': phone
                                    // 42
                                  })
                                  .then((value) => print("User Added"))
                                  .catchError((error) =>
                                      print("Failed to add user: $error"));
                              print(_users.orderBy(phone).get());
                              _email.clear();
                              _nameUser.clear();
                              _phone.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            } else {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text(
                                      "Tienes que llenar todos los campos"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        color: Colors.green,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("okay"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                    "No has haceptado terminos y condiciones"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: Colors.green,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                  ),
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
