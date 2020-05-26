import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeUserName extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangeUserNameState();
  }
}

class ChangeUserNameState extends State<ChangeUserName> {
  final String userName = "MIK_IYAS";

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
          title: Text("UserName"),
          actions: <Widget>[
            FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  // TODO Save the new ChangeUserName
                },
                child: Icon(Icons.check))
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 20, right: 20, bottom: 10, left: 20),
              child: TextField(
                onChanged: (String newValue) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, right: 20, bottom: 10, left: 20),
              child: Text(
                "You can choose a username on Telegraph. If you do, other people will be able to find you by this username and contact you without knowing your phone number.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, right: 20, bottom: 10, left: 20),
              child: Text(
                "You can use a-z, 0-9 and underscores. Minimum length is 5 characters.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, right: 20, bottom: 10, left: 20),
              child: Text(
                "This link opens a chat with you on Telegraph: ",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 0, right: 20, bottom: 10, left: 0),
                child: GestureDetector(
                  child: Text(
                    "https://t.me/$userName",
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Clipboard.setData(
                        new ClipboardData(text: "https://t.me/$userName"));
                    key.currentState.showSnackBar(
                        new SnackBar(content: new Text("Copied to clipboard")));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
