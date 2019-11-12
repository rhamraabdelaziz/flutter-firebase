import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Container(
            child:Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text('Welcom Data FireStore', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 12,),
                Text('Your Email is : ', style: TextStyle(color: Colors.white, fontSize: 16),),
                Text('Your Pass is : ' , style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            )
          ),
        ),
      ),
    );
  }
}
