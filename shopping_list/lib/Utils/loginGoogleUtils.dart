import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  //GOOGLE METHODS
  //signInWithGoogle
  static Future<User?> signInWithGoogle() async {
    User? user;
    GoogleSignInAccount? objGoogleSignInAccount = await googleSignIn.signIn();
    if (objGoogleSignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication =
          await objGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSignInAuthentication.accessToken,
          idToken: objGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("Error al iniciar sesión");
      }
    }
  }

  static Future<User?> _isCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser?.uid);

      //todo a ido bien.
      log(TAG + ', signInWithGoogle succeeded: $user');

      return user;
    }
    return null;
    //si no ha ido bien devolvemos un null.
  }

  //signOutGoogle
  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    log(TAG + ", User Signed Out, Google.");
  }

//getUserGoogle
  static GoogleSignInAccount? getUserGoogle() {
    try {
      return googleSignIn.currentUser;
    } catch (error) {
      throw Exception("Algo ha ido mal recuperando googleSignIn.currentUser");
    }
  }
}
