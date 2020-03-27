import 'package:flutter/material.dart';
import 'package:telegraph/ui/pages/homepage.dart';

class NewChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Channel",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              }),
          title: Text(
            "New Channel",
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
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/avatar_1.png", /*ImagePicker.pickImage(source: ImageSource.gallery)*/
                    )),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Channel name",
                      hintStyle: TextStyle(color: Colors.grey)),
                )
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "You can provide an optional description for your channel.",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
