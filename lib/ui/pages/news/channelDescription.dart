import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/news/newChannel.dart';

class ChannelDescription extends StatelessWidget {
  final ThemeData themeData;

  ChannelDescription({this.themeData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Channel Description",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeData.scaffoldBackgroundColor,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeData.iconTheme.color,
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
              style: themeData.textTheme.title,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Channels are a new tool for broadcasting your messages to large audiences",
                style: themeData.textTheme.subtitle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            FlatButton(color: themeData.buttonColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NewChannel()));
                },
                child: Text(
                  "CREATE CHANNEL",
                  style: themeData.textTheme.button,
                ))
          ],
        ),
      ),
    );
  }
}
