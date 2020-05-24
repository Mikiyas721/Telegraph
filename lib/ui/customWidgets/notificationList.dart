import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/dialogMenu.dart';
import 'mySwitchListTile.dart';

class NotificationList extends StatelessWidget {
  final Stream<bool> alertStream;
  final Stream<bool> messagePreviewStream;
  final Stream<String> vibrateStream;
  final Stream<String> popUpNotificationStream;
  final Stream<String> soundStream;
  final Stream<String> priorityStream;

  final Function(String) vibrateSink;
  final Function(String) popUpNotificationSink;
  final Function(String) soundSink;
  final Function(String) prioritySink;

  final Function(bool newValue) onAlertChanged;
  final Function(bool newValue) onMessagePreviewChanged;
  final Function(String selectedValue) onVibrateTypeSelected;
  final Function(String selectedValue) onPopUpNotificationSelected;
  final Function(String selectedValue) onSoundSelected;
  final Function(String selectedValue) onPrioritySelected;

  NotificationList(
      {@required this.alertStream,
      @required this.messagePreviewStream,
      @required this.vibrateStream,
      @required this.popUpNotificationStream,
      @required this.soundStream,
      @required this.priorityStream,
      @required this.vibrateSink,
      @required this.popUpNotificationSink,
      @required this.soundSink,
      @required this.prioritySink,
      this.onAlertChanged,
      this.onMessagePreviewChanged,
      this.onVibrateTypeSelected,
      this.onPopUpNotificationSelected,
      this.onSoundSelected,
      this.onPrioritySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: alertStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return MySwitchListTile(
              title: "Alert",
              onChanged: onAlertChanged,
              value: snapshot.data == null ? false : snapshot.data,
            );
          },
        ),
        StreamBuilder(
          stream: messagePreviewStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return MySwitchListTile(
              title: "Message Preview",
              onChanged: onMessagePreviewChanged,
              value: snapshot.data == null ? false : snapshot.data,
            );
          },
        ),
        ListTile(
          title: Text("LED Color"),
          trailing: Icon(
            Icons.phone_iphone,
            color: Colors.blue,
          ),
          onTap: () {},
        ),
        StreamBuilder(
          stream: vibrateStream,
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            return ListTile(
                title: Text("Vibrate"),
                trailing: Text(
                  "${snapShot.data == null ? "Default" : snapShot.data}",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: () async {
                  await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DialogMenu(
                            title: "Vibrate",
                            menus: [
                              "Disabled",
                              "Default",
                              "Short",
                              "Long",
                              "Only if silent"
                            ],
                            selectedValue: "Default",
                            parentSink: vibrateSink,
                          )).then(onVibrateTypeSelected);
                });
          },
        ),
        StreamBuilder(
            stream: popUpNotificationStream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              return ListTile(
                title: Text("Popup Notifications"),
                trailing: Text(
                  "${snapShot == null ? "No popup" : snapShot.data}",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: () async {
                  await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DialogMenu(
                            title: "Popup Notifications",
                            menus: [
                              "No popup",
                              'Only when screen "on"',
                              'Only when screen "off"',
                              "Always show popup"
                            ],
                            selectedValue: "No popup",
                            parentSink: popUpNotificationSink,
                          )).then(onPopUpNotificationSelected);
                },
              );
            }),
        StreamBuilder(
            stream: soundStream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              return ListTile(
                title: Text("Sound"),
                trailing: Text(
                  "${snapShot.data == null ? "No popup" : snapShot.data}",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: () async {
                  await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DialogMenu(
                          title: "Sound",
                          menus: [
                            "No popup", //TODO access the device ringtones
                            'Only when screen "on"',
                            'Only when screen "off"',
                            "Always show popup"
                          ],
                          selectedValue: "No popup",
                          parentSink: soundSink)).then(onSoundSelected);
                },
              );
            }),
        StreamBuilder(
            stream: priorityStream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              return ListTile(
                title: Text("Priority"),
                trailing: Text(
                  "${snapShot.data == null ? "High" : snapShot.data}",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: () async {
                  await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DialogMenu(
                            title: "Priority",
                            menus: ["Default", 'High', "Max"],
                            selectedValue: "High",
                            parentSink: prioritySink,
                          )).then(onPrioritySelected);
                },
              );
            })
      ],
    );
  }
}
