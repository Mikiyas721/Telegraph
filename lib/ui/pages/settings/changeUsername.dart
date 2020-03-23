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
        key: key,
        appBar: AppBar(
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
            TextField(),
            Text(
                "You can choose a username on Telegraph. If you do, other people will be able to find you by this username and contact you without knowing your phone number."),
            Text(
                "You can use a-z, 0-9 and underscores. Minimum length is 5 characters."),
            Text("This link opens a chat with you on Telegraph: "),
            GestureDetector(
              child: Text("https://t.me/$userName",
                  style: TextStyle(color: Colors.blue)),
              onTap: () {
                Clipboard.setData(
                    new ClipboardData(text: "https://t.me/$userName"));
                key.currentState.showSnackBar(
                    new SnackBar(content: new Text("Copied to clipboard")));
              },
            )
          ],
        ),
      ),
    );
  }
}
