import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/dialogMenu.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SwitchListTile(
          onChanged: (bool value) {},
          value: false,
          title: Text("Alert"),
        ),
        SwitchListTile(
          onChanged: (bool value) {},
          value: true,
          title: Text("Message Preview"),
        ),
        ListTile(
          title: Text("LED Color"),
          trailing: Icon(
            Icons.phone_iphone,
            color: Colors.blue,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text("Vibrate"),
          trailing: Text(
            "Default",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => DialogMenu("Vibrate", [
                      "Disabled",
                      "Default",
                      "Short",
                      "Long",
                      "Only if silent"
                    ]));
          },
        ),
        ListTile(
          title: Text("Popup Notifications"),
          trailing: Text(
            "No popup",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => DialogMenu("Popup Notifications", [
                  "No popup",
                  'Only when screen "on"',
                  'Only when screen "off"',
                  "Always show popup"
                ]));
          },
        ),
        ListTile(
          title: Text("Sound"),
          trailing: Text(
            "Default",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => DialogMenu("Sound", [
                  "No popup",//TODO access the device ringtones
                  'Only when screen "on"',
                  'Only when screen "off"',
                  "Always show popup"
                ]));
          },
        ),
        ListTile(
          title: Text("Priority"),
          trailing: Text(
            "High",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => DialogMenu("Priority", [
                  "Default",
                  'High',
                  "Max"
                ]));
          },
        ),
      ],
    );
  }
}
