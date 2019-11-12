import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firestoredata/UI/home.dart';
import 'package:firestoredata/Services/authentification.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Auth Service
   final AuthService myAuth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                // Email Text Input
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailControl,
                  validator: (valueEmail) {
                    if (valueEmail.isEmpty) {
                      return 'Please Enter Your Email address';
                    } return null;
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                      hintText: 'Email'
                  ),
                ),
                // Password Text Input
                TextFormField(
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                      hintText: 'Password'
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passControl,
                  validator: (valuePass) {
                    if (valuePass.isEmpty) {
                      return 'Please Enter Your Pass';
                    } return null;
                  },
                ),
                SizedBox(height: 12,),
                RaisedButton(
                elevation: 5,
                onPressed: () async {
                // Code when Button Pressed
                FirebaseUser userLog =  await myAuth.signInAnony();
                if (userLog != null) {
                // Go to Home Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                print('UserId : ' + userLog.isEmailVerified.toString());
                } else {
                print('LoginPage: Login Failed');
                }
                },
                padding: EdgeInsets.all(12),
                color: Colors.blueGrey[300],
                child: Text('Log in', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
        )
      );
  }
}

/**

/// From ///
    Form(
    key: _formKey,
    child: Center(
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
    children: <Widget>[
    // Email Text Input
    TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: emailControl,
    validator: (valueEmail) {
    if (valueEmail.isEmpty) {
    return 'Please Enter Your Email address';
    } return null;
    },
    decoration: InputDecoration(
    hintStyle: TextStyle(
    fontSize: 12,
    color: Colors.red,
    ),
    hintText: 'Email'
    ),
    ),
    // Password Text Input
    TextFormField(
    style: TextStyle(
    color: Colors.blueGrey[800],
    fontSize: 14,
    fontWeight: FontWeight.normal,
    ),
    decoration: InputDecoration(
    hintStyle: TextStyle(
    fontSize: 12,
    color: Colors.red,
    ),
    hintText: 'Password'
    ),
    keyboardType: TextInputType.visiblePassword,
    controller: passControl,
    validator: (valuePass) {
    if (valuePass.isEmpty) {
    return 'Please Enter Your Pass';
    } return null;
    },
    ),
    SizedBox(height: 12,),

    ],
    ),
    ),
    ),
    ),
 **/
