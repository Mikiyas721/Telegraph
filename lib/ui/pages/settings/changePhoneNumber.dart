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
        key: key,
        appBar: AppBar(
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
            Icon(Icons.sim_card),
            Text(
                "You can change your Telegram number here. Your account and all your cloud data - messages, media, contacts, etc. will be moved to the new number."),
            Text(
                "Important: all your Telegram contact will get your new number added to their address book, provided they had your old number and you haven't blocked them in Telegram."),
            FlatButton(
                onPressed: () {

                },
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
