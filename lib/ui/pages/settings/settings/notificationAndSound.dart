import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/notificationList.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';

class NotificationAndSounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("Notifications and Sounds"),
        ),
        body: ListView(
          children: <Widget>[
            SettingGroupTitle(
              "Group Notification",
              false,
              top: 20,
              left: 15,
            ),
            NotificationList(),
            SettingGroupTitle(
              "Group Notification",
              false,
              top: 20,
              left: 15,
            ),
            NotificationList(),
            SettingGroupTitle(
              "In-app notification",
              false,
              top: 20,
              left: 15,
            ),
            MySwitchListTile(title: "In-App Sounds"),
            MySwitchListTile(title: "In-App Vibrate"),
            MySwitchListTile(title: "In-App Preview"),
            MySwitchListTile(title: "In-Chat Sounds"),
            MySwitchListTile(title: "Priority"),
            SettingGroupTitle(
              "Voice calls",
              false,
              top: 20,
              left: 15,
            ),
            ListTile(
              title: Text("Vibrate"),
              trailing: Text(
                "Default",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text("Ringtone"),
              trailing: Text(
                "Default",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
