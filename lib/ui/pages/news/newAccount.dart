import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Account",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "New Account",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.check), onPressed: () {})
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
