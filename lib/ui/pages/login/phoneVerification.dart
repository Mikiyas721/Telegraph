import 'package:flutter/material.dart';
import 'package:telegraph/ui/pages/homepage.dart';
import 'package:telegraph/ui/pages/login/phoneNumberInput.dart';

class PhoneVerification extends StatelessWidget {
  final String message;

  PhoneVerification(String message) : message = message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Phone Verification",
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
            "Phone Verification",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Text(
                message,
                style: TextStyle(color: Colors.grey),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Code", hintStyle: TextStyle(color: Colors.grey)),
              ),
              Text(""),
              FlatButton(onPressed: () {}, child: Text("Didn't get the code")),
              Spacer(),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PhoneNumberInput()));
                  },
                  child: Text(
                    "Wrong number?",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
