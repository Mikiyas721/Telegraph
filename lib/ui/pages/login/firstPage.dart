import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.body2.color),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50, top: 8),
                child: Text(
                  "A fast and easy way of communication.",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context,'/phoneNumberInputPage');
                  },
                  child: Text(
                    "Start Messaging...",
                    style: Theme.of(context).textTheme.button,
                  ))
            ],
          ),
        ));
  }
}
