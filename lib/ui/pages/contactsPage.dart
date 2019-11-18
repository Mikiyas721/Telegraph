import 'package:flutter/material.dart';
import '../customWidgets/chatListItem.dart';

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
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                child: Text(
                  "Contacts",
                ),
                padding: EdgeInsets.only(left: 10, top: 7, bottom: 7),
              ),
              color: Color.fromRGBO(250, 0, 0, 230),
            ),
            ChatListItem('assets/item_type_food.png', "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/item_type_food.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
          ],
        ),
      ),
    );
  }
}
