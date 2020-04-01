import 'package:flutter/material.dart';
import 'package:telegraph/ui/pages/login/phoneNumberInput.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                child: Image.asset(
                  "assets/logo.jpg",
                  width: 100,
                  height: 100,
                ),
                padding: EdgeInsets.only(
                  top: 150,
                  bottom: 50,
                )),
            Text(
              "Telegraph",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, top: 8),
              child: Text(
                "A fast and easy way of communication.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            RaisedButton(
                color: Colors.lightBlue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PhoneNumberInput()));
                },
                child: Text("Start Messaging..."))
          ],
        ),
      )),
    );
  }
}
