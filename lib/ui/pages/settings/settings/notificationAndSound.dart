import 'package:Telegraph/controll/blocs/notificationBloc.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/notificationList.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';

class NotificationAndSoundsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        blocFactory: () => NotificationBloc(),
        builder: (BuildContext context, bloc) {
          bloc.setInAppSounds(
              PreferenceHandler.getPreference(PreferenceHandler.inAppSound));
          bloc.setInAppVibrate(
              PreferenceHandler.getPreference(PreferenceHandler.inAppVibrate));
          bloc.setInAppPreview(
              PreferenceHandler.getPreference(PreferenceHandler.inAppPreview));
          bloc.setInChatSounds(
              PreferenceHandler.getPreference(PreferenceHandler.inChatSound));
          bloc.setInAppPriority(
              PreferenceHandler.getPreference(PreferenceHandler.inAppPriority));
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text(
                "Notifications and Sounds",
                style: Theme.of(context).textTheme.title,
              ),
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
                  vibrateString: PreferenceHandler.messageVibrate,
                  popUpString: PreferenceHandler.messagePopup,
                  soundString: PreferenceHandler.messageSound,
                  priorityString: PreferenceHandler.messagePriority,
                  onAlertChanged: (bool newValue) {
                    bloc.setMessageAlert(newValue);
                    /*SharedPreferenceHandler.getInstance()
                          .setMessageAlert(newValue);*/
                  },
                  onMessagePreviewChanged: (bool newValue) {
                    bloc.setMessagePreview(newValue);
                    PreferenceHandler.setPreference(
                        PreferenceHandler.messagePreview, newValue);
                  },
                  onVibrateTypeSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessageVibrate(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.messageVibrate, newValue);
                    }
                  },
                  onPopUpNotificationSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessagePopup(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.messagePopup, newValue);
                    }
                  },
                  onSoundSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessageSound(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.messageSound, newValue);
                    }
                  },
                  onPrioritySelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessagePriority(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.messagePriority, newValue);
                    }
                  },
                  readSharedPreferences: () {
                    bloc.setMessageAlert(PreferenceHandler.getPreference(
                        PreferenceHandler.messageAlert));
                    bloc.setMessagePreview(PreferenceHandler.getPreference(
                        PreferenceHandler.messagePreview));
                    bloc.setMessageVibrate(PreferenceHandler.getPreference(
                        PreferenceHandler.messageVibrate));
                    bloc.setMessagePopup(PreferenceHandler.getPreference(
                        PreferenceHandler.messagePopup));
                    bloc.setMessageSound(PreferenceHandler.getPreference(
                        PreferenceHandler.messageSound));
                    bloc.setMessagePriority(PreferenceHandler.getPreference(
                        PreferenceHandler.messagePriority));
                  },
                  themeData: Theme.of(context),
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
                  vibrateString: PreferenceHandler.groupVibrate,
                  popUpString: PreferenceHandler.groupPopup,
                  soundString: PreferenceHandler.groupSound,
                  priorityString: PreferenceHandler.groupPriority,
                  onAlertChanged: (bool newValue) {
                    bloc.setGroupAlert(newValue);
                    PreferenceHandler.setPreference(
                        PreferenceHandler.groupAlert, newValue);
                  },
                  onMessagePreviewChanged: (bool newValue) {
                    bloc.setGroupPreview(newValue);
                    PreferenceHandler.setPreference(
                        PreferenceHandler.groupPreview, newValue);
                  },
                  onVibrateTypeSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupVibrate(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.groupVibrate, newValue);
                    }
                  },
                  onPopUpNotificationSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupPopup(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.groupPopup, newValue);
                    }
                  },
                  onSoundSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupSound(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.groupSound, newValue);
                    }
                  },
                  onPrioritySelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupPriority(newValue);
                      PreferenceHandler.setPreference(
                          PreferenceHandler.groupPriority, newValue);
                    }
                  },
                  readSharedPreferences: () {
                    bloc.setGroupAlert(PreferenceHandler.getPreference(
                        PreferenceHandler.groupAlert));
                    bloc.setGroupPreview(PreferenceHandler.getPreference(
                        PreferenceHandler.groupPreview));
                    bloc.setGroupVibrate(PreferenceHandler.getPreference(
                        PreferenceHandler.groupVibrate));
                    bloc.setGroupPopup(PreferenceHandler.getPreference(
                        PreferenceHandler.groupPopup));
                    bloc.setGroupSound(PreferenceHandler.getPreference(
                        PreferenceHandler.groupSound));
                    bloc.setGroupPriority(PreferenceHandler.getPreference(
                        PreferenceHandler.groupPriority));
                  },
                  themeData: Theme.of(context),
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
                            : snapChat.data,
                        themeData: Theme.of(context),
                      );
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
                            : snapChat.data,
                        themeData: Theme.of(context),
                      );
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
                            : snapChat.data,
                        themeData: Theme.of(context),
                      );
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
                              : snapChat.data,
                          themeData: Theme.of(context));
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
                            : snapChat.data,
                        themeData: Theme.of(context),
                      );
                    }),
                SettingGroupTitle(
                  "Voice calls",
                  false,
                  top: 20,
                  left: 15,
                ),
                ListTile(
                  title: Text(
                    "Vibrate",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  trailing: Text(
                    "Default",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Ringtone", style: Theme.of(context).textTheme.body2),
                  trailing: Text(
                    "Default",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
