import 'package:flutter/material.dart';
import 'UI/home.dart';
import 'package:firestoredata/UI/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireStore Data',
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );

  }
}
