import 'package:flutter/material.dart';

class MyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Theme",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Card(
                margin: EdgeInsets.all(0),
                color: Colors.white,
                child: FlatButton(
                    onPressed: () {}, child: Text("Create New Theme")),
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              shape: null,
              color: Colors.grey,
              child: Text(
                "You can create your own theme by changing the colors within the app. You can always switch bacj to the default Telegraph theme here.",
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
