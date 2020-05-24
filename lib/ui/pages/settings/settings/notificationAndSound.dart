import 'package:Telegraph/controll/blocs/notificationBloc.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/notificationList.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';

class NotificationAndSounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        blocFactory: () => NotificationBloc(),
        builder: (BuildContext context, bloc) {
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
                    "Message Notifications",
                    false,
                    top: 20,
                    left: 15,
                  ),
                  NotificationList(
                    alertStream: bloc.messageAlert,
                    messagePreviewStream: bloc.messagePreview,
                    vibrateStream: bloc.messageVibrate,
                    popUpNotificationStream: bloc.messagePopup,
                    soundStream: bloc.messageSound,
                    priorityStream: bloc.messagePriority,
                    vibrateSink: bloc.setMessageVibrate,
                    popUpNotificationSink: bloc.setMessagePopup,
                    soundSink: bloc.setMessageSound,
                    prioritySink: bloc.setMessagePriority,
                    onAlertChanged: (bool newValue) {
                      bloc.setMessageAlert(newValue);
                    },
                    onMessagePreviewChanged: (bool newValue) {
                      bloc.setMessagePreview(newValue);
                    },
                    onVibrateTypeSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessageVibrate(newValue);
                      }
                    },
                    onPopUpNotificationSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessagePopup(newValue);
                      }
                    },
                    onSoundSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessageSound(newValue);
                      }
                    },
                    onPrioritySelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessagePriority(newValue);
                      }
                    },
                  ),
                  SettingGroupTitle(
                    "Group Notifications",
                    false,
                    top: 20,
                    left: 15,
                  ),
                  NotificationList(
                    alertStream: bloc.groupAlert,
                    messagePreviewStream: bloc.groupPreview,
                    vibrateStream: bloc.groupVibrate,
                    popUpNotificationStream: bloc.groupPopup,
                    soundStream: bloc.groupSound,
                    priorityStream: bloc.groupPriority,
                    vibrateSink: bloc.setGroupVibrate,
                    popUpNotificationSink: bloc.setGroupPopup,
                    soundSink: bloc.setGroupSound,
                    prioritySink: bloc.setGroupPriority,
                    onAlertChanged: (bool newValue) {
                      bloc.setGroupAlert(newValue);
                    },
                    onMessagePreviewChanged: (bool newValue) {
                      bloc.setGroupPreview(newValue);
                    },
                    onVibrateTypeSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupVibrate(newValue);
                      }
                    },
                    onPopUpNotificationSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupPopup(newValue);
                      }
                    },
                    onSoundSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupSound(newValue);
                      }
                    },
                    onPrioritySelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupPriority(newValue);
                      }
                    },
                  ),
                  SettingGroupTitle(
                    "In-app notification",
                    false,
                    top: 20,
                    left: 15,
                  ),
                  StreamBuilder(
                      stream: bloc.inAppSounds,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Sounds",
                            onChanged: bloc.setInAppSounds,
                            value:
                                snapChat.data == null ? false : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.inAppVibrate,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Vibrate",
                            onChanged: bloc.setInAppVibrate,
                            value:
                                snapChat.data == null ? true : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.inAppPreview,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Preview",
                            onChanged: bloc.setInAppPreview,
                            value:
                                snapChat.data == null ? false : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.inChatSounds,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-Chat Sounds",
                            onChanged: bloc.setInChatSounds,
                            value:
                                snapChat.data == null ? true : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.priority,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "Priority",
                            onChanged: bloc.setPriority,
                            value:
                                snapChat.data == null ? false : snapChat.data);
                      }),
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
        });
  }
}
