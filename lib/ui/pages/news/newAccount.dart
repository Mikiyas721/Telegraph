import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "New Account",
          style: TextStyle(
              color: Theme.of(context).textTheme.body2.color,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check, color: Theme.of(context).iconTheme.color),
              onPressed: () {})
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
    );
  }
}
