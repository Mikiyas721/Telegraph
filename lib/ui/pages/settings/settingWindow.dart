import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/infoDisplay.dart';
import 'package:telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:telegraph/ui/pages/settings/info/changePhoneNumber.dart';
import 'package:telegraph/ui/pages/settings/info/changeUsername.dart';
import 'package:telegraph/ui/pages/settings/settings/chatBackground.dart';
import 'package:telegraph/ui/pages/settings/settings/languages.dart';
import 'package:telegraph/ui/pages/settings/settings/notificationAndSound.dart';
import 'package:telegraph/ui/pages/settings/settings/theme.dart';

class SettingWindow extends StatefulWidget {
  final SettingWindowState settingWindow;

  SettingWindow() : settingWindow = SettingWindowState();

  @override
  State<StatefulWidget> createState() {
    return settingWindow;
  }
}

class SettingWindowState extends State<SettingWindow> {
  String imageURL = "assets/avatar_1.png";
  String userName = "Miki";
  String userString = "@MIKI_YAS";
  String phoneNumber = "+251 941135730";
  bool online = false;
  bool enableAnimation = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Setting',
        home: Scaffold(
          appBar: AppBar(
            leading: FlatButton(
                textColor: Colors.white,
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: ListTile(
              leading: Image.asset(
                imageURL,
              ),
              title: Align(
                child: Text(
                  userName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                alignment: Alignment(-1.2, 0),
              ),
              subtitle: Text(
                '$online',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
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
          body: getBody(),
        ));
  }

  List<PopupMenuEntry> getMenu() {
    List<String> menuListString = [
      'Edit name',
      'Log out',
    ];
    List<PopupMenuEntry> menuList = [];
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(child: Text(menu)));
    }
    return menuList;
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        SettingGroupTitle("Info", top: 15, left: 15),
        InfoDisplay(
          phoneNumber,
          "Phone",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChangePhoneNumber()));
          },
        ),
        Divider(
          thickness: 1,
        ),
        InfoDisplay(userString, "Username", onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangeUserName()));
        }),
        getSettings(),
        getMessages(),
        getSupports()
      ],
    );
  }

  Widget getSettings() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingGroupTitle("Settings", top: 20, left: 15),
          ListTile(
            title: Text("Notification and Sounds"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          NotificationAndSounds()));
            },
          ),
          Divider(thickness: 1),
          ListTile(title: Text("Privacy and Security")),
          Divider(thickness: 1),
          ListTile(title: Text("Data and Storage")),
          Divider(thickness: 1),
          ListTile(
            title: Text("Chat Background"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatBackground()));
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text("Theme"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyTheme()));
            },
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text("Language"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Languages()));
            },
          ),
          Divider(
            thickness: 1,
          ),
          SwitchListTile(
              onChanged: (bool newValue) {
                setState(() {
                  enableAnimation = !enableAnimation;
                });
              },
              value: enableAnimation,
              title: Text("Enable Amimation"))
        ]);
  }

  Widget getMessages() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingGroupTitle(
            "Messages",
            top: 20,
            left: 15,
          ),
          SwitchListTile(
            onChanged: (bool newValue) {},
            value: false,
            title: Text("In-App Browser"),
            subtitle: Text(
              "Open External links with in app",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Divider(thickness: 1),
          SwitchListTile(
            onChanged: (bool newValue) {},
            value: false,
            title: Text("Direct Share"),
            subtitle: Text(
              "Show recent chats in share menu",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text("Stickers"),
          ),
          Divider(thickness: 1),
          ListTile(
            title: Text("Message Text Size"),
            trailing: Text(
              "16",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Divider(thickness: 1),
          SwitchListTile(
            onChanged: (bool newValue) {},
            value: false,
            title: Text("Raise to Speak"),
          ),
          Divider(thickness: 1),
          SwitchListTile(
            onChanged: (bool newValue) {},
            value: false,
            title: Text("Send by Enter"),
          ),
          Divider(thickness: 1),
          SwitchListTile(
            onChanged: (bool newValue) {},
            value: false,
            title: Text("Autoplay GIFs"),
          ),
          Divider(thickness: 1),
          SwitchListTile(
            onChanged: (bool newValue) {},
            value: false,
            title: Text("Save to Gallery"),
          ),
        ]);
  }

  Widget getSupports() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingGroupTitle(
            "Supports",
            top: 20,
            left: 15,
          ),
          ListTile(title: Text("Ask a question")),
          Divider(thickness: 1),
          ListTile(title: Text("Telegraph FAQ")),
          Divider(thickness: 1),
          ListTile(title: Text("Privacy Policy")),
        ]);
  }
}
