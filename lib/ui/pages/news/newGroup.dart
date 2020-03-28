import 'package:flutter/material.dart';
import 'package:telegraph/ui/pages/contactsPage.dart';

class NewGroupAndSecretChat extends StatelessWidget {
  final String title;

  const NewGroupAndSecretChat(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Group",
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
            title,
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
        body: ListView(
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 8),
                  hintText: "Add people ...",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            Column(
              children: getPlaceHolderContacts(context),
            )
          ],
        ),
      ),
    );
  }
}
