import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/notificationList.dart';
import 'package:telegraph/ui/customWidgets/settingGroupTitle.dart';

class NotificationAndSounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool alert = false;
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
            SwitchListTile(
              onChanged: (bool value) {},
              value: true,
              title: Text("In-App Sounds"),
            ),
            SwitchListTile(
              onChanged: (bool value) {},
              value: true,
              title: Text("In-App Vibrate"),
            ),
            SwitchListTile(
              onChanged: (bool value) {},
              value: true,
              title: Text("In-App Preview"),
            ),
            SwitchListTile(
              onChanged: (bool value) {},
              value: true,
              title: Text("In-Chat Sounds"),
            ),
            SwitchListTile(
              onChanged: (bool value) {},
              value: false,
              title: Text("Priority"),
            ),
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
