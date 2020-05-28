import 'package:Telegraph/controll/others/chatType.dart';
import 'package:Telegraph/ui/customWidgets/contactsList.dart';
import 'package:Telegraph/ui/pages/news/newAccount.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/news/channelDescription.dart';
import '../customWidgets/chatListItem.dart';
import 'chatWindow.dart';
import 'news/newGroup.dart';

class ContactsPage extends StatelessWidget {
  final String title = 'New Message';
  final Iterable<Contact> contacts;
  final ThemeData themeData;

  ContactsPage(Iterable<Contact> contacts,{this.themeData}) : contacts = contacts;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact Page",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: themeData.iconTheme.color,
              )),
          title: Text("$title", style: themeData.textTheme.title,),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: themeData.iconTheme.color,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NewAccount(themeData:themeData)));
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
              children: <Widget>[ContactList(contacts)],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
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
