import 'package:flutter/material.dart';

class noteDetail extends StatefulWidget {
  String appBarTitle;

  noteDetail(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {

    return noteDetailState(this.appBarTitle);
  }

}

class noteDetailState extends State<noteDetail> {

  static var _priorities = ['Hight', 'Low'];
  String appBarTitle;

  // Constructor with One String Parameter
  noteDetailState(this.appBarTitle);

  // Declared to Control what user put in field
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope( // User to control navigation Back buton of your Device.
      onWillPop: () {
        // Write code to control things, When user Press Back navigation button in device.
        moveToLastScreen();
      },
      child:Scaffold(

      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon
          (Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            }
            )
      ),


      body: Padding(
          padding: EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),

          child: ListView(

            children: <Widget>[

              //First element of Listview
              ListTile(
                title: DropdownButton(
                    items: _priorities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                      );
                    }).toList(),

                    style: textStyle,
                    value: 'Low',
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint('User select $valueSelectedByUser');
                      });
                    }
                ),
              ),

              // Second element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something Changed in Title Text Field');
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ) ,
              ),

              // Third element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something Changed in Description Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                ) ,
              ),

              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint('Save button Clicked');
                              });
                            }
                        )
                    ),

                    Container(width: 5.0,), // Give space between two raised Button

                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Delete',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint('Delete button Clicked');
                              });
                            }
                        )
                    ),
                  ],
                ),
              )

            ],
          ),
      )
    ));
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}

