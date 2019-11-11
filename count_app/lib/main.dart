import 'package:flutter/material.dart';
void main() {                                           // Create Yout Main Function
  runApp(
  MaterialApp(                                          // Implement Material Desgin on your App
      title: "Stateful App Emxaple",
      home: FavoriteCity(),                             // Call @FavorityCity Function
    )
  );
}


class FavoriteCity extends StatefulWidget {

  @override                                             // Implementing Missing Function which return State
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCitySate();                        // Return the State of your stateful widget
  }
}

class _FavoriteCitySate extends State<FavoriteCity> {  // Create a State class with properties that may change

  String nameCity = "";
  var _currencies = ['MAD', 'DOLLAR','EURO'];
  String _currentItemSelected = "MAD";

  @override
  Widget build(BuildContext context) {
    debugPrint("Favorite City Widget is Created");
      return Scaffold(
        appBar: AppBar(
          title: Text("Stateful App Example"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField (
                onChanged: (String userInput) {  // onChanged event handler
                  setState(() {
                    debugPrint('Set State is called, this tells framework to redraw the FavCity widgets');
                    nameCity = userInput;
                  });
                  },
              ),

              DropdownButton<String> (                                  // Start DropDown Button
                items: _currencies.map((String dropDownStringItem) {   //  start Item of this Drop Down
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                onChanged: (String newValueSelected) {
                    // Your Code to execute, when a menu item is selected from drop down
                    onDropDownItemSelected(newValueSelected);  // Function called to execute setState() Method
                },

                value: _currentItemSelected,
              ),



              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                "Your Best city is : $nameCity",
                style: TextStyle(fontSize: 20.0),
              )
              )
            ],
          ),
        ),
      );
    }

    void onDropDownItemSelected(String newValueSelected) {  // function implemented in
      setState(() {
        this._currentItemSelected = newValueSelected;
      });
    }
  }

