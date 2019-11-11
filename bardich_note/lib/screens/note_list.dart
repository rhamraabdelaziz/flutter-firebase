import 'package:flutter/material.dart';
import 'package:bardich_note/screens/note_detail.dart';

class NoteList extends StatefulWidget { // Create first home screen

@override // Create State Method
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState(); // Return the state of this home screen
  }
}

class NoteListState extends State<NoteList> { // Create the state will be returned above

  int count = 0;

  @override // Override Build method of state
  Widget build(BuildContext context) {

    // Scaffold Main Function whcih Contain all elements of your Screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),

      // Body which call the ListView
      body: getListview(),

      // Floating Action Bar
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB Clicked');
            navigateToDetail('Add Note');
          },
        tooltip: 'Add Note',
        child: Icon(Icons.add),

      ),
    );
  }

  ListView getListview() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  child: Icon(Icons.keyboard_arrow_right),
                ),
                title: Text('Dunmy Title', style: titleStyle,),
                subtitle: Text('Dunmy Date'),
                trailing: Icon(Icons.delete, color: Colors.grey,),
                onTap: () {
                  debugPrint('Listtitle Taped');
                  navigateToDetail('Edit Note');
                },
              ),
            );

        },
    );
  }

  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return noteDetail(title);
    }));
  }
}