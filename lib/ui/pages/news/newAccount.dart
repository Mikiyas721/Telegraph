import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatelessWidget {
  final ThemeData themeData;
  NewAccount({this.themeData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Account",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeData.iconTheme.color,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "New Account",
            style: TextStyle(color: themeData.textTheme.body2.color, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.check,color:themeData.iconTheme.color), onPressed: () {})
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) * 0.2,
                  right: (MediaQuery.of(context).size.width) * 0.2,
                  top: 10,
                  bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "First Name(required)",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) * 0.2,
                  right: (MediaQuery.of(context).size.width) * 0.2),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Last Name(optional)",
                      hintStyle: TextStyle(color: Colors.grey))),
            ),
            CountryCodePicker(
              initialSelection: "+251",
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) * 0.2,
                  right: (MediaQuery.of(context).size.width) * 0.2),
              child: TextField(
                  decoration: InputDecoration(
                      helperText: "--- --- ---",
                      helperStyle: TextStyle(color: Colors.grey))),
            ),
          ],
        ),
      ),
    );
  }
}
