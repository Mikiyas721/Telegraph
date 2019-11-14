import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsPageState();
  }
}

class ContactsPageState extends State<ContactsPage> {
  String title = 'New Message';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text("$title"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.people),
              title: Text('New Group'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('New Secret Chat'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.volume_up),
              title: Text('New Channel'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
