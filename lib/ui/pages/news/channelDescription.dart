import 'dart:ui';
import 'package:flutter/material.dart';

class ChannelDescriptionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
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
            style: Theme.of(context).textTheme.title,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Channels are a new tool for broadcasting your messages to large audiences",
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          FlatButton(
              color: Theme.of(context).buttonColor,
              onPressed: () {
                Navigator.pushNamed(
                    context,'/newChannelPage');
              },
              child: Text(
                "CREATE CHANNEL",
                style: Theme.of(context).textTheme.button,
              ))
        ],
      ),
    );
  }
}
