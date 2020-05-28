import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/dialogMenu.dart';
import 'package:rxdart/rxdart.dart';
import 'mySwitchListTile.dart';

class NotificationList extends StatelessWidget {
  final BehaviorSubject<bool> alertStream;
  final BehaviorSubject<bool> messagePreviewStream;
  final BehaviorSubject<String> vibrateStream;
  final BehaviorSubject<String> popUpStream;
  final BehaviorSubject<String> soundStream;
  final BehaviorSubject<String> priorityStream;

  final Function(String) vibrateSink;
  final Function(String) popUpNotificationSink;
  final Function(String) soundSink;
  final Function(String) prioritySink;

  final Future<bool> Function(String) vibrateSharedPreference;
  final Future<bool> Function(String) popUpSharedPreference;
  final Future<bool> Function(String) soundSharedPreference;
  final Future<bool> Function(String) prioritySharedPreference;

  final Function(bool newValue) onAlertChanged;
  final Function(bool newValue) onMessagePreviewChanged;
  final Function(String selectedValue) onVibrateTypeSelected;
  final Function(String selectedValue) onPopUpNotificationSelected;
  final Function(String selectedValue) onSoundSelected;
  final Function(String selectedValue) onPrioritySelected;

  final Function() readSharedPreferences;

  final ThemeData themeData;

  NotificationList(
      {@required this.alertStream,
      @required this.messagePreviewStream,
      @required this.vibrateStream,
      @required this.popUpStream,
      @required this.soundStream,
      @required this.priorityStream,
      @required this.vibrateSink,
      @required this.popUpNotificationSink,
      @required this.soundSink,
      @required this.prioritySink,
      @required this.vibrateSharedPreference,
      @required this.popUpSharedPreference,
      @required this.soundSharedPreference,
      @required this.prioritySharedPreference,
      @required this.readSharedPreferences,
      @required this.onAlertChanged,
      @required this.onMessagePreviewChanged,
      @required this.onVibrateTypeSelected,
      @required this.onPopUpNotificationSelected,
      @required this.onSoundSelected,
      @required this.onPrioritySelected,this.themeData});

  @override
  Widget build(BuildContext context) {
    readSharedPreferences();
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: alertStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return MySwitchListTile(
              title: "Alert",
              onChanged: onAlertChanged,
              value: snapshot.data == null
                  ? alertStream.value == null ? false : alertStream.value
                  : snapshot.data,themeData: themeData,
            );
          },
        ),
        StreamBuilder(
          stream: messagePreviewStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return MySwitchListTile(
              title: "Message Preview",
              onChanged: onMessagePreviewChanged,
              value: snapshot.data == null
                  ? messagePreviewStream.value == null
                      ? false
                      : messagePreviewStream.value
                  : snapshot.data,themeData: themeData
            );
          },
        ),
        ListTile(
          title: Text("LED Color",style: themeData.textTheme.body2,),
          trailing: Icon(
            Icons.phone_iphone,
            color: themeData.iconTheme.color,
          ),
          onTap: () {},
        ),
        StreamBuilder(
          stream: vibrateStream,
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            return ListTile(
                title: Text("Vibrate", style: themeData.textTheme.body2,),
                trailing: Text(
                  "${snapShot.data == null ? messagePreviewStream.value == null ? "Default" : messagePreviewStream.value : snapShot.data}",
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
                            selectedValue: snapShot.data == null
                                ? vibrateStream.value == null
                                    ? "Default"
                                    : snapShot.data
                                : vibrateStream.value,
                            parentSink: vibrateSink,
                            sharedPreferenceSink: vibrateSharedPreference,
                          )).then(onVibrateTypeSelected);
                });
          },
        ),
        StreamBuilder(
            stream: popUpStream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              return ListTile(
                title: Text("Popup Notifications",style: themeData.textTheme.body2,),
                trailing: Text(
                  "${snapShot == null ? messagePreviewStream.value == null ? "No popup" : messagePreviewStream.value : snapShot.data}",
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
                            selectedValue: snapShot.data == null
                                ? popUpStream.value == null
                                ? "No popup"
                                : snapShot.data
                                : popUpStream.value,
                            parentSink: popUpNotificationSink,
                            sharedPreferenceSink: popUpSharedPreference,
                          )).then(onPopUpNotificationSelected);
                },
              );
            }),
        StreamBuilder(
            stream: soundStream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              return ListTile(
                title: Text("Sound",style: themeData.textTheme.body2,),
                trailing: Text(
                  "${snapShot.data == null ? messagePreviewStream.value == null ? "No popup" : messagePreviewStream.value : snapShot.data}",
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
                            selectedValue: snapShot.data == null
                                ? soundStream.value == null
                                ? "No popup"
                                : snapShot.data
                                : soundStream.value,
                            parentSink: soundSink,
                            sharedPreferenceSink: soundSharedPreference,
                          )).then(onSoundSelected);
                },
              );
            }),
        StreamBuilder(
            stream: priorityStream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              return ListTile(
                title: Text("Priority",style: themeData.textTheme.body2,),
                trailing: Text(
                  "${snapShot.data == null ? messagePreviewStream.value == null ? "Default" : messagePreviewStream.value : snapShot.data}",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: () async {
                  await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DialogMenu(
                            title: "Priority",
                            menus: ["Default", 'High', "Max"],
                            selectedValue: snapShot.data == null
                                ? priorityStream.value == null
                                ? "Default"
                                : snapShot.data
                                : priorityStream.value,
                            parentSink: prioritySink,
                            sharedPreferenceSink: prioritySharedPreference,
                          )).then(onPrioritySelected);
                },
              );
            })
      ],
    );
  }
}
