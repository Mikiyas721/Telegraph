import 'package:Telegraph/controll/blocs/notificationBloc.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
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
          SharedPreferenceHandler instance =
              SharedPreferenceHandler.getInstance();
          instance.getInAppSound().then((savedValue) {
            bloc.setInAppSounds(savedValue);
          });
          instance.getInAppVibrate().then((savedValue) {
            bloc.setInAppVibrate(savedValue);
          });
          instance.getInAppPreview().then((savedValue) {
            bloc.setInAppPreview(savedValue);
          });
          instance.getInChatSound().then((savedValue) {
            bloc.setInChatSounds(savedValue);
          });
          instance.getInAppPriority().then((savedValue) {
            bloc.setInAppPriority(savedValue);
          });
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
                    // Make the widgets here read the saved setting
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
                      SharedPreferenceHandler.getInstance()
                          .setMessageAlert(newValue);
                    },
                    onMessagePreviewChanged: (bool newValue) {
                      bloc.setMessagePreview(newValue);
                      SharedPreferenceHandler.getInstance()
                          .setMessagePreview(newValue);
                    },
                    onVibrateTypeSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessageVibrate(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setMessageVibrate(newValue);
                      }
                    },
                    onPopUpNotificationSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessagePopup(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setMessagePopup(newValue);
                      }
                    },
                    onSoundSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessageSound(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setMessageSound(newValue);
                      }
                    },
                    onPrioritySelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setMessagePriority(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setMessagePriority(newValue);
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
                      SharedPreferenceHandler.getInstance()
                          .setGroupAlert(newValue);
                    },
                    onMessagePreviewChanged: (bool newValue) {
                      bloc.setGroupPreview(newValue);
                      SharedPreferenceHandler.getInstance()
                          .setGroupPreview(newValue);
                    },
                    onVibrateTypeSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupVibrate(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setGroupVibrate(newValue);
                      }
                    },
                    onPopUpNotificationSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupPopup(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setGroupPopup(newValue);
                      }
                    },
                    onSoundSelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupSound(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setGroupSound(newValue);
                      }
                    },
                    onPrioritySelected: (String newValue) {
                      if (newValue != null) {
                        bloc.setGroupPriority(newValue);
                        SharedPreferenceHandler.getInstance()
                            .setGroupPriority(newValue);
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
                            value: snapChat.data == null
                                ? (bloc.inAppSoundsStream.value == null
                                    ? false
                                    : bloc.inAppSoundsStream.value)
                                : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.inAppVibrate,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Vibrate",
                            onChanged: bloc.setInAppVibrate,
                            value:
                                snapChat.data == null ? (bloc.inAppVibrateStream.value == null
                                    ? false
                                    : bloc.inAppVibrateStream.value) : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.inAppPreview,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Preview",
                            onChanged: bloc.setInAppPreview,
                            value:
                                snapChat.data == null ? (bloc.inAppPreviewStream.value == null
                                    ? false
                                    : bloc.inAppPreviewStream.value) : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.inChatSounds,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-Chat Sounds",
                            onChanged: bloc.setInChatSounds,
                            value:
                                snapChat.data == null ? (bloc.inChatSoundsStream.value == null
                                    ? false
                                    : bloc.inChatSoundsStream.value) : snapChat.data);
                      }),
                  StreamBuilder(
                      stream: bloc.priority,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "Priority",
                            onChanged: bloc.setInAppPriority,
                            value:
                                snapChat.data == null ? (bloc.inAppPriorityStream.value == null
                                    ? false
                                    : bloc.inAppPriorityStream.value) : snapChat.data);
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
