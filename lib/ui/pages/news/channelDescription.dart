import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/news/newChannel.dart';

class ChannelDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Channel Description",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black45,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                child: Image.asset(
                  "assets/channel.jpg",
                  width: 180,
                  height: 180,
                ),
                padding: EdgeInsets.only(bottom: 30, top: 30)),
            Text(
              "What is a Channel?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Channels are a new tool for broadcasting your messages to large audiences",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NewChannel()));
                },
                child: Text(
                  "CREATE CHANNEL",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
