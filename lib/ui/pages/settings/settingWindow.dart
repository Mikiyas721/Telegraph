import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/infoDisplay.dart';
import 'package:telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:telegraph/ui/pages/login/firstPage.dart';
import 'package:telegraph/ui/pages/settings/info/changePhoneNumber.dart';
import 'package:telegraph/ui/pages/settings/info/changeUsername.dart';
import 'package:telegraph/ui/pages/settings/settings/chatBackground.dart';
import 'package:telegraph/ui/pages/settings/settings/dataAndStorage.dart';
import 'package:telegraph/ui/pages/settings/settings/languages.dart';
import 'package:telegraph/ui/pages/settings/settings/notificationAndSound.dart';
import 'package:telegraph/ui/pages/settings/settings/privacyAndSecurity/privacyAndSecurity.dart';
import 'package:telegraph/ui/pages/settings/settings/theme.dart';
import 'package:numberpicker/numberpicker.dart' as picker;

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
                onSelected: (selectedValue) {
                  if (selectedValue == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => FirstPage()));
                  }
                },
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
    int i = 0;
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(value: i, child: Text(menu)));
      i++;
    }
    return menuList;
  }

  Widget getBody() {
    return ListView(
        children: ListTile.divideTiles(context: context, tiles: [
      SettingGroupTitle(
        "Info",
        false,
        top: 15,
        left: 15,
        bottom: 5,
      ),
      InfoDisplay(
        phoneNumber,
        "Phone",
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangePhoneNumber()));
        },
      ),
      InfoDisplay(userString, "Username", onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChangeUserName()));
      }),
      SettingGroupTitle(
        "Settings",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      ListTile(
        title: Text("Notification and Sounds"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NotificationAndSounds()));
        },
      ),
      ListTile(
        title: Text("Privacy and Security"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyAndSecurity()));
        },
      ),
      ListTile(
        title: Text("Data and Storage"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DataAndStorage()));
        },
      ),
      ListTile(
        title: Text("Chat Background"),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatBackground()));
        },
      ),
      ListTile(
        title: Text("Theme"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyTheme()));
        },
      ),
      ListTile(
        title: Text("Language"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Languages()));
        },
      ),
      SwitchListTile(
          onChanged: (bool newValue) {
            setState(() {
              enableAnimation = !enableAnimation;
            });
          },
          value: enableAnimation,
          title: Text("Enable Amimation")),
      SettingGroupTitle(
        "Messages",
        false,
        top: 20,
        left: 15,
        bottom: 5,
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
      SwitchListTile(
        onChanged: (bool newValue) {},
        value: false,
        title: Text("Direct Share"),
        subtitle: Text(
          "Show recent chats in share menu",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      ListTile(
        title: Text("Stickers"),
      ),
      ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    picker.NumberPickerDialog.integer(
                  title: Text(
                    "Message Text Size",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  minValue: 11,
                  maxValue: 30,
                  initialIntegerValue: 12,
                  infiniteLoop: true,
                ),
              ));
        },
        title: Text("Message Text Size"),
        trailing: Text(
          "12",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      SwitchListTile(
        onChanged: (bool newValue) {},
        value: false,
        title: Text("Raise to Speak"),
      ),
      SwitchListTile(
        onChanged: (bool newValue) {},
        value: false,
        title: Text("Send by Enter"),
      ),
      SwitchListTile(
        onChanged: (bool newValue) {},
        value: false,
        title: Text("Autoplay GIFs"),
      ),
      SwitchListTile(
        onChanged: (bool newValue) {},
        value: false,
        title: Text("Save to Gallery"),
      ),
      SettingGroupTitle(
        "Supports",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      ListTile(title: Text("Ask a question")),
      ListTile(title: Text("Telegraph FAQ")),
      ListTile(title: Text("Privacy Policy")),
    ]).toList());
  }
}
