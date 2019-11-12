import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _userAuth = FirebaseAuth.instance;

  // Sign in Anonymously
  Future signInAnony() async {
    try {
        AuthResult result = await _userAuth.signInAnonymously();
        FirebaseUser user = result.user;
        return user;
    } catch (excepAuthAnon) {
        print('App authentication failed : ' + excepAuthAnon.toString());
        return null;
    }

  }


  // Sign in With Email and Pasword


  // Register With Email and Password


  // Sign Out

}