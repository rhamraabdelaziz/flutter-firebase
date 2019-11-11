import 'package:flutter/material.dart';

void main() {

  // start Main Method
  runApp(

    MaterialApp(                          // Materila App Widget
      debugShowCheckedModeBanner: false, // Remove Demo banner from your App
      title: 'Simple Calculator',
      home: SIForm(),                    // Call StatefulWidget within a home
    )
  );
}

class SIForm extends StatefulWidget { // Stateful Widget which called in home propertie
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {

  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Dirham', 'Dollar', 'Euro'];
  var _currentSelectedtem = "Dirham";

  TextEditingController princController = TextEditingController();

  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();

  String displayResult = '';
  final minmPadd = 5.0;

  @override
  void initState() {
    super.initState();
    _currentSelectedtem = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),

      body: Form(      // Form instead of container
        key: _formKey, // Key of Form Widget
        //margin: EdgeInsets.all(minmPadd * 2), not supported within Form Widgets
        child: Padding(
          padding: EdgeInsets.all(minmPadd * 2),
        child: ListView(
          children: <Widget>[
            getImageSet(),  // image Function
            Padding(      // Padding For First TextField (Top & Bottom)
              padding: EdgeInsets.only(top: minmPadd, bottom: minmPadd),
              child: TextFormField(      // First TextField
                keyboardType: TextInputType.number,
                controller: princController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please Enter principal amount";
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Principals',
                    hintText: 'Enter Pricipal e.g 12000',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              )),

            Padding(
                padding: EdgeInsets.only(top: minmPadd, bottom: minmPadd),
                child:TextFormField(    // Second TextField
                  keyboardType: TextInputType.number,
                  controller: rateController,
                  validator: (String value) {  // Validation TextField
                    if (value.isEmpty) {      // Validation condition
                      // Your Code
                      return "Please Enter rate";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'Enter Pricipal e.g 12000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                )),

            Padding(
                padding: EdgeInsets.only(top: minmPadd, bottom: minmPadd),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(    // Third TextField
                          keyboardType: TextInputType.number,
                          controller: termController,  // implement Controller in Your TextFiled
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter term Value';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                        )
                    ),
                    Container(width: minmPadd * 2),
                    Expanded(
                        child: DropdownButton<String>(

                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String> (
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currentSelectedtem,
                          onChanged: (String newValueSelected) {
                            // Your Code to execute, when a menu item is selected from dropdown
                            onDropDownItemSelected(newValueSelected);
                          },

                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          iconSize: 20.0,
                          isExpanded: true,
                          
                        )),
                  ],
                )),

            Padding(
              padding: EdgeInsets.only(top: minmPadd, bottom: minmPadd),
              child:
                  Row(
                    children: <Widget>[

                      Expanded(
                          child: RaisedButton(
                              child: Text('Calculate'),
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) { // Validation Button
                                    this.displayResult = _calculateTtolaReturn();
                                  }
                                });
                              }
                          )
                      ),

                      Expanded(
                          child: RaisedButton(
                              child: Text('Reset'),
                              onPressed: () {
                                setState(() {
                                  _reset();
                                });
                              }
                          )
                      ),

                    ],
                  )),
            Padding(
              padding: EdgeInsets.all(minmPadd),
              child: Text(
                    getTitle(),
                    textAlign: TextAlign.center,)
            )

          ],
        )),

      ),
    );
  }

  Widget getImageSet() {

    AssetImage assetImage = AssetImage('images/login.png');
    Image image = Image(image: assetImage, width: 120.0, height: 120.0,);

    return Container(child: image, margin: EdgeInsets.all(minmPadd * 10),);
  }

  String getTitle() {
    return displayResult;

  }

  // onChanged function of DropDown  Menu Item
  void onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedtem = newValueSelected;
    });
  }

  //
  String _calculateTtolaReturn() {

    // Extract data of Principal TextField
    double principal = double.parse(princController.text); // Get The thext etered by user in your TextField
    double roi = double.parse(rateController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentSelectedtem';

    return result;

  }

  void _reset() {

    princController.text = '';
    rateController.text = '';
    termController.text = '';

    displayResult = '';
    _currentSelectedtem = _currencies[0];

  }

}

