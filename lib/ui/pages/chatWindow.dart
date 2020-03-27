import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/messageDisplay.dart';
import '../../models/chatType.dart';

class ChatWindow extends StatefulWidget {
  final ChatWindowState chatWindowState;

  ChatWindow(String chatTitle, String imageURL, ChatType chatType,
      {List<String> menus})
      : chatWindowState = ChatWindowState(chatTitle, imageURL, chatType, menus);

  @override
  State<StatefulWidget> createState() {
    return chatWindowState;
  }
}

class ChatWindowState extends State<ChatWindow> {
  final String chatTitle;
  final String imageURL;
  final List<String> menuListString;
  final ChatType chatType;

  ChatWindowState(
      this.chatTitle, this.imageURL, this.chatType, this.menuListString);

  List<PopupMenuEntry> getMenu() {
    if (menuListString != null) {
      List<PopupMenuEntry> menuList = [];
      for (String menu in menuListString) {
        menuList.add(new PopupMenuItem(child: Text(menu)));
      }
      return menuList;
    } else if (chatType == ChatType.GROUP) {
      List<String> menuListString = [
        'Search',
        'Clear history',
        'Delete and leave Group',
        'Mute Notification'
      ];
      List<PopupMenuEntry> menuList = [];
      for (String menu in menuListString) {
        menuList.add(new PopupMenuItem(child: Text(menu)));
      }
      return menuList;
    } else if (chatType == ChatType.SINGLE) {
      List<String> menuListString = [
        'Call',
        'Search',
        'Clear history',
        'Delete chat',
        'Mute Notification'
      ];
      List<PopupMenuEntry> menuList = [];
      for (String menu in menuListString) {
        menuList.add(new PopupMenuItem(child: Text(menu)));
      }
      return menuList;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10, top: 7, bottom: 7),
                child: Image.asset(imageURL),
              ),
              Text(chatTitle)
            ],
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (selectedValue) {},
              itemBuilder: (context) {
                return getMenu();
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/chatBackground_8.jpeg"),
                  fit: BoxFit.cover)),
          child: ListView(
            reverse: true,
            children: <Widget>[
              MessageDisplay("Testing123", "04:56"),
              MessageDisplay(
                  "Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123 Testing123Testing123Testing123",
                  "04:56"),
              MessageDisplay("Testing123", "04:56"),
              MessageDisplay("Testing123", "04:56"),
              MessageDisplay("Testing123", "04:56")
            ],
          ),
        ),
        bottomSheet: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.sentiment_very_satisfied),
              onTap: () {},
            ),
            TextField(
              onChanged: (newValue) {},
              cursorColor: Colors.white,
              decoration: InputDecoration.collapsed(
                  hintText: 'Message',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 18,
                  )),
            ),
            GestureDetector(
              child: Icon(Icons.attach_file),
              onTap: () {},
            ),
            GestureDetector(
              child: Icon(Icons.keyboard_voice),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
