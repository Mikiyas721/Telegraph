import 'package:flutter/material.dart';
import '../../models/chatType.dart';

class ChatWindow extends StatefulWidget {
  ChatWindowState chatWindowState;

  ChatWindow(String chatTitle, String imageURL, ChatType chatType,
      {List<String> menus}) {
    chatWindowState = ChatWindowState(chatTitle, imageURL, chatType, menus);
  }

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
            children: <Widget>[Image.asset(imageURL), Text(chatTitle)],
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
        body: Card(color: Colors.black12,),
        bottomSheet: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.sentiment_very_satisfied),
              onTap: () {},
            ),
            /*TextField(
              onChanged: (newValue){},
              onTap: () {},
              decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),*/
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
