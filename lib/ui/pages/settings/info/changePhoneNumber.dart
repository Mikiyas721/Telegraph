import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePhoneNumber extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangePhoneNumberState();
  }
}

class ChangePhoneNumberState extends State<ChangePhoneNumber> {
  final String phoneNumber = "+251 941135730";

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return MaterialApp(
      title: "Change UserName",
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: key,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text(phoneNumber),
        ),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: Icon(
                  Icons.sim_card,
                  color: Colors.grey,
                  size: 80,
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 25, top: 30, bottom: 10, right: 25),
                child: Text(
                  "You can change your Telegram number here. Your account and all your cloud data - messages, media, contacts, etc. will be moved to the new number.",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 25, top: 5, bottom: 80, right: 25),
                child: Text(
                  "Important: all your Telegram contact will get your new number added to their address book, provided they had your old number and you haven't blocked them in Telegram.",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "CHANGE NUMBER",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
