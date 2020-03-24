import 'package:flutter/material.dart';

class ChatBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Background",
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
          title: Text(
            "Chat Background",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        bottomSheet: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[],
        ),
      ),
    );
  }
}
