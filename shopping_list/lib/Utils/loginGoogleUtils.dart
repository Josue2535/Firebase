import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  //GOOGLE METHODS
  //signInWithGoogle
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }

  static Future<User?> _isCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = auth.currentUser;
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
