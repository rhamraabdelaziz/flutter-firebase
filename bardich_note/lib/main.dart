import 'package:flutter/material.dart';
import 'package:bardich_note/screens/note_list.dart';
import 'package:bardich_note/screens/note_detail.dart';

  // 1-- Create Your Main Function

void main() {
  // 2-- Call Your App within runApp() Function
  runApp(myApp());
}

// 3-- Create Your App called from the --2 step
class myApp extends StatelessWidget {

  // 4-- Override Build function of StatelessWidget
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'bardichNote', // Define The Title
      debugShowCheckedModeBanner: false, // Remove the debug
      theme: ThemeData( // Define the Theme
        primarySwatch: Colors.deepPurple
      ),
      home:NoteList(), // Define home as the first Screen
    );
  }
}