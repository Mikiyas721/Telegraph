import 'package:Telegraph/ui/customWidgets/myPhotoView.dart';
import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/infoDisplay.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:Telegraph/ui/pages/login/firstPage.dart';
import 'package:Telegraph/ui/pages/settings/info/changePhoneNumber.dart';
import 'package:Telegraph/ui/pages/settings/info/changeUsername.dart';
import 'package:Telegraph/ui/pages/settings/settings/chatBackground.dart';
import 'package:Telegraph/ui/pages/settings/settings/dataAndStorage.dart';
import 'package:Telegraph/ui/pages/settings/settings/languages.dart';
import 'package:Telegraph/ui/pages/settings/settings/notificationAndSound.dart';
import 'package:Telegraph/ui/pages/settings/settings/privacyAndSecurity/privacyAndSecurity.dart';
import 'package:Telegraph/ui/pages/settings/settings/theme.dart';
import 'package:numberpicker/numberpicker.dart' as picker;
import 'package:Telegraph/ui/customWidgets/myImageView.dart';

class SettingWindow extends StatelessWidget {
  final String imageURL = "assets/avatar_1.png";
  final String userName = "Miki";
  final String userString = "@MIKI_YAS";
  final String phoneNumber = "+251 941135730";
  final bool online = false;
  final bool enableAnimation = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Setting',
        home: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool) => [
                    SliverAppBar(
                      expandedHeight: 150,
                      pinned: true,
                      leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      flexibleSpace: FlexibleSpaceBar(
                          titlePadding:
                              EdgeInsets.only(top: 15, left: 70, bottom: 3),
                          centerTitle: false,
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                  child: GestureDetector(
                                    child: MyImageView(imageURL),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MyPhotoView(imageURL)));
                                    },
                                  ),
                                  padding: EdgeInsets.only(right: 5)),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    userName,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    getOnlineString(),
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              )
                            ],
                          )),
                      /*title: ListTile(
                        leading: GestureDetector(
                          child: MyImageView(
                            imageURL,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyPhotoView(imageURL)));
                          },
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
                      ),*/
                      actions: <Widget>[
                        PopupMenuButton(
                          onSelected: (selectedValue) {
                            if (selectedValue == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FirstPage()));
                            }
                          },
                          itemBuilder: (context) {
                            return getMenu();
                          },
                        )
                      ],
                    )
                  ],
              body: getBody(context)),
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

  Widget getBody(BuildContext context) {
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
      MySwitchListTile(
        "Enable Amimation",
      ),
      SettingGroupTitle(
        "Messages",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      MySwitchListTile(
        "In-App Browser",
        subTitle: "Open External links with in app",
      ),
      MySwitchListTile(
        "Direct Share",
        subTitle: "Show recent chats in share menu",
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
      MySwitchListTile(
        "Raise to Speak",
      ),
      MySwitchListTile(
        "Send by Enter",
      ),
      MySwitchListTile(
        "Autoplay GIFs",
      ),
      MySwitchListTile(
        "Save to Gallery",
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

  String getOnlineString() {
    if (online)
      return "Online";
    else
      return "last seen 08:22 AM"; //TODO replace hard coded time string with actually last seen data
  }
  // TODO Consider Using preferences library
}
