import 'package:Telegraph/controll/blocs/notificationBloc.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/notificationList.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';

class NotificationAndSounds extends StatelessWidget {
  final ThemeData themeData;
  NotificationAndSounds({this.themeData});
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
              backgroundColor: themeData.scaffoldBackgroundColor,
              appBar: AppBar(
                backgroundColor: themeData.primaryColor,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,color: themeData.iconTheme.color,),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text("Notifications and Sounds",style: themeData.textTheme.title,),
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
                    alertStream: bloc.messageAlertStream,
                    messagePreviewStream: bloc.messagePreviewStream,
                    vibrateStream: bloc.messageVibrateStream,
                    popUpStream: bloc.messagePopupStream,
                    soundStream: bloc.messageSoundStream,
                    priorityStream: bloc.messagePriorityStream,
                    vibrateSink: bloc.setMessageVibrate,
                    popUpNotificationSink: bloc.setMessagePopup,
                    soundSink: bloc.setMessageSound,
                    prioritySink: bloc.setMessagePriority,
                    vibrateSharedPreference: instance.setMessageVibrate,
                    popUpSharedPreference:  instance.setMessagePopup,
                    soundSharedPreference:  instance.setMessageSound,
                    prioritySharedPreference:  instance.setMessagePriority,
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
                    readSharedPreferences: () {
                      SharedPreferenceHandler instance = SharedPreferenceHandler.getInstance();
                          instance.getMessageAlert()
                          .then((savedValue) {
                        bloc.setMessageAlert(savedValue);
                      });
                      instance.getMessagePreview()
                          .then((savedValue) {
                        bloc.setMessagePreview(savedValue);
                      });
                      instance.getMessageVibrate()
                          .then((savedValue) {
                        bloc.setMessageVibrate(savedValue);
                      });
                      instance.getMessagePopup()
                          .then((savedValue) {
                        bloc.setMessagePopup(savedValue);
                      });
                      instance.getMessageSound()
                          .then((savedValue) {
                        bloc.setMessageSound(savedValue);
                      });
                      instance.getMessagePriority()
                          .then((savedValue) {
                        bloc.setMessagePriority(savedValue);
                      });
                    },
                    themeData: themeData,
                  ),
                  SettingGroupTitle(
                    "Group Notifications",
                    false,
                    top: 20,
                    left: 15,
                  ),
                  NotificationList(
                    alertStream: bloc.groupAlertStream,
                    messagePreviewStream: bloc.groupPreviewStream,
                    vibrateStream: bloc.groupVibrateStream,
                    popUpStream: bloc.groupPopupStream,
                    soundStream: bloc.groupSoundStream,
                    priorityStream: bloc.groupPriorityStream,
                    vibrateSink: bloc.setGroupVibrate,
                    popUpNotificationSink: bloc.setGroupPopup,
                    soundSink: bloc.setGroupSound,
                    prioritySink: bloc.setGroupPriority,
                    vibrateSharedPreference: instance.setGroupVibrate,
                    popUpSharedPreference:  instance.setGroupPopup,
                    soundSharedPreference:  instance.setGroupSound,
                    prioritySharedPreference:  instance.setGroupPriority,
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
                    }, readSharedPreferences: () {
                    SharedPreferenceHandler instance = SharedPreferenceHandler.getInstance();
                    instance.getGroupAlert()
                        .then((savedValue) {
                      bloc.setGroupAlert(savedValue);
                    });
                    instance.getGroupPreview()
                        .then((savedValue) {
                      bloc.setGroupPreview(savedValue);
                    });
                    instance.getGroupVibrate()
                        .then((savedValue) {
                      bloc.setGroupVibrate(savedValue);
                    });
                    instance.getGroupPopup()
                        .then((savedValue) {
                      bloc.setGroupPopup(savedValue);
                    });
                    instance.getGroupSound()
                        .then((savedValue) {
                      bloc.setGroupSound(savedValue);
                    });
                    instance.getGroupPriority()
                        .then((savedValue) {
                      bloc.setGroupPriority(savedValue);
                    });
                  },themeData: themeData,
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
                                : snapChat.data,themeData: themeData,);
                      }),
                  StreamBuilder(
                      stream: bloc.inAppVibrate,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Vibrate",
                            onChanged: bloc.setInAppVibrate,
                            value: snapChat.data == null
                                ? (bloc.inAppVibrateStream.value == null
                                    ? false
                                    : bloc.inAppVibrateStream.value)
                                : snapChat.data,themeData: themeData,);
                      }),
                  StreamBuilder(
                      stream: bloc.inAppPreview,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-App Preview",
                            onChanged: bloc.setInAppPreview,
                            value: snapChat.data == null
                                ? (bloc.inAppPreviewStream.value == null
                                    ? false
                                    : bloc.inAppPreviewStream.value)
                                : snapChat.data,themeData: themeData,);
                      }),
                  StreamBuilder(
                      stream: bloc.inChatSounds,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "In-Chat Sounds",
                            onChanged: bloc.setInChatSounds,
                            value: snapChat.data == null
                                ? (bloc.inChatSoundsStream.value == null
                                    ? false
                                    : bloc.inChatSoundsStream.value)
                                : snapChat.data,themeData: themeData);
                      }),
                  StreamBuilder(
                      stream: bloc.priority,
                      builder: (BuildContext context, AsyncSnapshot snapChat) {
                        return MySwitchListTile(
                            title: "Priority",
                            onChanged: bloc.setInAppPriority,
                            value: snapChat.data == null
                                ? (bloc.inAppPriorityStream.value == null
                                    ? false
                                    : bloc.inAppPriorityStream.value)
                                : snapChat.data,themeData: themeData,);
                      }),
                  SettingGroupTitle(
                    "Voice calls",
                    false,
                    top: 20,
                    left: 15,
                  ),
                  ListTile(
                    title: Text("Vibrate", style: themeData.textTheme.body2,),
                    trailing: Text(
                      "Default",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Ringtone",style: themeData.textTheme.body2),
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
