import 'package:Telegraph/ui/pages/news/newAccount.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/chatType.dart';
import 'package:Telegraph/ui/pages/news/channelDescription.dart';
import '../customWidgets/chatListItem.dart';
import 'chatWindow.dart';
import 'news/newGroup.dart';

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
      title: "Contact Page",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text("$title"),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NewAccount()));
                },
                icon: Icon(
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            NewGroupAndSecretChat("New Group")));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('New Secret Chat'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            NewGroupAndSecretChat("New Secret Chat")));
              },
            ),
            ListTile(
              leading: Icon(Icons.volume_up),
              title: Text('New Channel'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ChannelDescription()));
              },
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
            Column(
              children: getPlaceHolderContacts(context),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NewAccount()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

List<Widget> getPlaceHolderContacts(BuildContext context) {
  List<Widget> widgets = List<Widget>();
  for (int i = 0; i < 20; i++) {
    widgets.add(ChatListItem(
        "assets/avatar_1.png", "Rotractors", 1, 19, "PM", "Hi,How are you", () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatWindow(
                  "Kebede", "assets/avatar_1.png", ChatType.SINGLE)));
    }, () {}));
  }
  return widgets;
}
