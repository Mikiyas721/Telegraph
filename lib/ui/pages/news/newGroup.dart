import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/contactsPage.dart';

class NewGroupAndSecretChat extends StatelessWidget {
  final String title;
  final ThemeData themeData;

  const NewGroupAndSecretChat(this.title, {Key key, this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Group",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeData.iconTheme.color,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            title,
            style: themeData.textTheme.title,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: themeData.iconTheme.color,
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
                  hintStyle: themeData.textTheme.body1),
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
