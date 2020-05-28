import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePhoneNumber extends StatelessWidget {
  final String phoneNumber = "+251 941135730";
  final ThemeData themeData;

  ChangePhoneNumber({this.themeData});

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return MaterialApp(
      title: "Change UserName",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        key: key,
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          leading: FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: themeData.iconTheme.color,
              )),
          title: Text(
            phoneNumber,
            style: themeData.textTheme.title,
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: Icon(
                  Icons.sim_card,
                  color: themeData.iconTheme.color,
                  size: 80,
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 25, top: 30, bottom: 10, right: 25),
                child: Text(
                  "You can change your Telegram number here. Your account and all your cloud data - messages, media, contacts, etc. will be moved to the new number.",
                  style: themeData.textTheme.body1,
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 25, top: 5, bottom: 80, right: 25),
                child: Text(
                  "Important: all your Telegram contact will get your new number added to their address book, provided they had your old number and you haven't blocked them in Telegram.",
                  style: themeData.textTheme.body1,
                  textAlign: TextAlign.center,
                )),
            FlatButton(
                color: themeData.buttonColor,
                onPressed: () {},
                child: Text(
                  "CHANGE NUMBER",
                  style: themeData.textTheme.button,
                ))
          ],
        ),
      ),
    );
  }
}
