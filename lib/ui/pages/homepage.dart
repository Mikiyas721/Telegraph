import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/chatListItem.dart';
import '../pages/searchPage.dart';
import '../customWidgets/MyDrawer.dart';
import 'contactsPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String title = 'Telegraph';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          /*leading: FlatButton(onPressed: () {}, child: Icon(Icons.dehaze)),*/
          title: Text("$title"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
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
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
            ChatListItem("assets/avatar_1.png", "Rotractors", 1, 19, "PM",
                "Hi,How are you", () {}, () {}),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactsPage()));
          },
          child: Icon(Icons.create),
        ),
      ),
    );
  }
}
