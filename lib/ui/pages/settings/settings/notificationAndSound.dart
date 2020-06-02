import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/notificationBloc.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
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
              PreferenceKeys.getPreference(PreferenceKeys.inAppSound));
          bloc.setInAppVibrate(
              PreferenceKeys.getPreference(PreferenceKeys.inAppVibrate));
          bloc.setInAppPreview(
              PreferenceKeys.getPreference(PreferenceKeys.inAppPreview));
          bloc.setInChatSounds(
              PreferenceKeys.getPreference(PreferenceKeys.inChatSound));
          bloc.setInAppPriority(
              PreferenceKeys.getPreference(PreferenceKeys.inAppPriority));
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
                  vibrateString: PreferenceKeys.messageVibrate,
                  popUpString: PreferenceKeys.messagePopup,
                  soundString: PreferenceKeys.messageSound,
                  priorityString: PreferenceKeys.messagePriority,
                  onAlertChanged: (bool newValue) {
                    bloc.setMessageAlert(newValue);
                    /*SharedPreferenceHandler.getInstance()
                          .setMessageAlert(newValue);*/
                  },
                  onMessagePreviewChanged: (bool newValue) {
                    bloc.setMessagePreview(newValue);
                    PreferenceKeys.setPreference(
                        PreferenceKeys.messagePreview, newValue);
                  },
                  onVibrateTypeSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessageVibrate(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.messageVibrate, newValue);
                    }
                  },
                  onPopUpNotificationSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessagePopup(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.messagePopup, newValue);
                    }
                  },
                  onSoundSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessageSound(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.messageSound, newValue);
                    }
                  },
                  onPrioritySelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setMessagePriority(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.messagePriority, newValue);
                    }
                  },
                  readSharedPreferences: () {
                    bloc.setMessageAlert(PreferenceKeys.getPreference(
                        PreferenceKeys.messageAlert));
                    bloc.setMessagePreview(PreferenceKeys.getPreference(
                        PreferenceKeys.messagePreview));
                    bloc.setMessageVibrate(PreferenceKeys.getPreference(
                        PreferenceKeys.messageVibrate));
                    bloc.setMessagePopup(PreferenceKeys.getPreference(
                        PreferenceKeys.messagePopup));
                    bloc.setMessageSound(PreferenceKeys.getPreference(
                        PreferenceKeys.messageSound));
                    bloc.setMessagePriority(PreferenceKeys.getPreference(
                        PreferenceKeys.messagePriority));
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
                  vibrateString: PreferenceKeys.groupVibrate,
                  popUpString: PreferenceKeys.groupPopup,
                  soundString: PreferenceKeys.groupSound,
                  priorityString: PreferenceKeys.groupPriority,
                  onAlertChanged: (bool newValue) {
                    bloc.setGroupAlert(newValue);
                    PreferenceKeys.setPreference(
                        PreferenceKeys.groupAlert, newValue);
                  },
                  onMessagePreviewChanged: (bool newValue) {
                    bloc.setGroupPreview(newValue);
                    PreferenceKeys.setPreference(
                        PreferenceKeys.groupPreview, newValue);
                  },
                  onVibrateTypeSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupVibrate(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.groupVibrate, newValue);
                    }
                  },
                  onPopUpNotificationSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupPopup(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.groupPopup, newValue);
                    }
                  },
                  onSoundSelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupSound(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.groupSound, newValue);
                    }
                  },
                  onPrioritySelected: (String newValue) {
                    if (newValue != null) {
                      bloc.setGroupPriority(newValue);
                      PreferenceKeys.setPreference(
                          PreferenceKeys.groupPriority, newValue);
                    }
                  },
                  readSharedPreferences: () {
                    bloc.setGroupAlert(PreferenceKeys.getPreference(
                        PreferenceKeys.groupAlert));
                    bloc.setGroupPreview(PreferenceKeys.getPreference(
                        PreferenceKeys.groupPreview));
                    bloc.setGroupVibrate(PreferenceKeys.getPreference(
                        PreferenceKeys.groupVibrate));
                    bloc.setGroupPopup(PreferenceKeys.getPreference(
                        PreferenceKeys.groupPopup));
                    bloc.setGroupSound(PreferenceKeys.getPreference(
                        PreferenceKeys.groupSound));
                    bloc.setGroupPriority(PreferenceKeys.getPreference(
                        PreferenceKeys.groupPriority));
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
