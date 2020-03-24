import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Languages",
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
            "Languages",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: ListView(),
      ),
    );
  }
}
