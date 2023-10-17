import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

checkStateChanges() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      if (kDebugMode) {
        print('User is signed in!');
      }
    } else {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    }
  });
}
