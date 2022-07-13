import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Analythics {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

  Future logPostCreated() async {
    await FirebaseAnalytics.instance.logBeginCheckout(
        value: 10.0,
        currency: 'USD',
        items: [
          AnalyticsEventItem(
              itemName: 'Socks', itemId: 'xjw73ndnw', price: 10.0),
        ],
        coupon: '10PERCENTOFF');
    print("se manda mensaje");
  }

  static bool emailChek(String email) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty || !regex.hasMatch(email))
      return false;
    else
      return true;
  }

  static bool nameChek(String name) {
    String pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regex = RegExp(pattern);
    if (name == null || name.isEmpty || regex.hasMatch(name))
      return false;
    else
      return true;
  }

  static bool phoneChek(String phone) {
    String pattern = r'[0-9]{10}$';
    RegExp regex = RegExp(pattern);
    if (phone == null || phone.isEmpty || !regex.hasMatch(phone))
      return false;
    else
      return true;
  }

  static Future<bool> phoneExist(String phone) async {
    CollectionReference _users = FirebaseFirestore.instance.collection('users');
    final snapshot = await _users.doc(phone).get();
    if (snapshot.exists) {
      print(snapshot);
      return true;
    }
    return false;
  }
}
