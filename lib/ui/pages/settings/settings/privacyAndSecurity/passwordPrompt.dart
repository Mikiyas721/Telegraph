import 'package:flutter/material.dart';

class PasswordPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Enter Password",
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
          title: Text("Password"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Text(
                "Enter a passcode",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                style: TextStyle(fontSize: 30),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20, bottom: 3)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
