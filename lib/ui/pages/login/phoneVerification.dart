import 'package:Telegraph/controll/others/assistant.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/homepage.dart';
import 'package:Telegraph/ui/pages/login/phoneNumberInput.dart';

class PhoneVerification extends StatelessWidget {
  final String message;
  final ThemeData themeData;

  PhoneVerification(String message, {this.themeData}) : message = message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Phone Verification",
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
            "Phone Verification",
            style: themeData.textTheme.title,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: themeData.iconTheme.color,
                ),
                onPressed: () {
                  Assistant.setUpDefaults();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(themeData: themeData,)));
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  message,
                  style: themeData.textTheme.caption,
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Code", hintStyle: themeData.textTheme.body1),
              ),
              Text(""),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Didn't get the code",
                    style: TextStyle(color: Colors.blue),
                  )),
              Spacer(),
              FlatButton(
                  color: themeData.buttonColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PhoneNumberInput()));
                  },
                  child: Text(
                    "Wrong number?",
                    style: themeData.textTheme.button,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
