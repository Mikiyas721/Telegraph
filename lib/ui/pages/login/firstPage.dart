import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/login/phoneNumberInput.dart';

class FirstPage extends StatelessWidget {
  final ThemeData themeData;
  FirstPage({this.themeData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: themeData.scaffoldBackgroundColor,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: themeData.textTheme.body2.color),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, top: 8),
              child: Text(
                "A fast and easy way of communication.",
                style: themeData.textTheme.caption,
              ),
            ),
            RaisedButton(
                color: themeData.buttonColor,
                textColor: themeData.textTheme.button.color,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PhoneNumberInput(themeData:themeData)));
                },
                child: Text("Start Messaging...", style: themeData.textTheme.button,))
          ],
        ),
      )),
    );
  }
}
