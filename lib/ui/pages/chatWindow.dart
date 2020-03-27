import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
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
          body: DashChat(
              onLongPressMessage: (ChatMessage chatMessage) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        getMessageDialog(context));
              },
              messages: [
                ChatMessage(text: "Testing", user: ChatUser(name: "Mikiyas"))
              ],
              user: ChatUser(name: "Mikiyas"),
              onSend: (ChatMessage chatMessage) {})),
    );
  }

  Widget getMessageDialog(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 10,bottom: 10),
      title: Text(
        "Message",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView(

            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                dense: true,
                leading: Icon(Icons.subdirectory_arrow_left),
                title: Text("Reply",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.content_copy),
                title: Text("Copy",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text("Forward",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text("Forward without quoting",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.edit),
                title: Text("Edit",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.delete),
                title: Text("Delete",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.cloud_upload),
                title: Text("Save to my cloud",style: TextStyle(fontSize: 16),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
