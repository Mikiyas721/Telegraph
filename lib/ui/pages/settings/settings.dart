import 'package:flutter/material.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/settingBloc.dart';
import 'package:Telegraph/controll/others/assistant.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/ui/customWidgets/myPhotoView.dart';
import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:Telegraph/ui/customWidgets/infoDisplay.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:numberpicker/numberpicker.dart' as picker;
import 'package:Telegraph/ui/customWidgets/myImageView.dart';

class SettingPage extends StatelessWidget {
  final String imageURL = "assets/avatar_1.png";
  final String userName = "Miki";
  final String userString = "@MIKI_YAS";
  final String phoneNumber = "+251 941135730";
  final bool online = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
        blocFactory: () => SettingBloc(),
        builder: (BuildContext context, bloc) {
          bloc.setAnimationEnabled(PreferenceHandler.getPreference(PreferenceHandler.enableAnimation));
          bloc.setInAppBrowser(PreferenceHandler.getPreference(PreferenceHandler.inAppBrowser));
          bloc.setDirectShare(PreferenceHandler.getPreference(PreferenceHandler.directShare));
          bloc.setMessageTextSize(PreferenceHandler.getPreference(PreferenceHandler.messageTextSize));
          bloc.setRaiseToSpeak(PreferenceHandler.getPreference(PreferenceHandler.raiseToSpeak));
          bloc.setSendByEnter(PreferenceHandler.getPreference(PreferenceHandler.sendByEnter));
          bloc.setAutoPlayGif(PreferenceHandler.getPreference(PreferenceHandler.autoPlayGIF));
          bloc.setSaveToGallery(PreferenceHandler.getPreference(PreferenceHandler.saveToGallery));

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool) => [
                      SliverAppBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        expandedHeight: 150,
                        pinned: true,
                        leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        flexibleSpace: FlexibleSpaceBar(
                            titlePadding:
                                EdgeInsets.only(top: 15, left: 70, bottom: 3),
                            centerTitle: false,
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    child: GestureDetector(
                                      child: MyImageView(imageURL),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        MyPhotoView(imageURL)));
                                      },
                                    ),
                                    padding: EdgeInsets.only(right: 5)),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      userName,
                                      style: Theme.of(context).textTheme.subtitle,
                                    ),
                                    Text(
                                      getOnlineString(),
                                      style: Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                )
                              ],
                            )),
                        actions: <Widget>[
                          PopupMenuButton(
                            color: Theme.of(context).backgroundColor,
                            onSelected: (selectedValue) {
                              onPopUpSelected(selectedValue, context);
                            },
                            itemBuilder: (context) {
                              return getMenu(context);
                            },
                          )
                        ],
                      )
                    ],
                body: getBody(context, bloc)),
          );
        });
  }

  List<PopupMenuEntry> getMenu(BuildContext context) {
    List<String> menuListString = [
      'Reset to Default',
      'Edit name',
      'Log out',
    ];
    List<PopupMenuEntry> menuList = [];
    int i = 1;
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(
          value: i, child: Text(menu, style: Theme.of(context).textTheme.body2)));
      i++;
    }
    return menuList;
  }

  Widget getBody(BuildContext context, SettingBloc bloc) {
    return ListView(
        children: ListTile.divideTiles(context: context, tiles: [
      SettingGroupTitle(
        "Info",
        false,
        top: 15,
        left: 15,
        bottom: 5,
      ),
      InfoDisplay(
        phoneNumber,
        "Phone",
        onTap: () {
          Navigator.pushNamed(
              context,'/changePhoneNumberPage');
        },
        themeData: Theme.of(context),
      ),
      InfoDisplay(
        userString,
        "Username",
        onTap: () {
          Navigator.pushNamed(
              context,'/changeUserNamePage');
        },
        themeData: Theme.of(context),
      ),
      SettingGroupTitle(
        "Settings",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      ListTile(
        title: Text(
          "Notification and Sounds",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(
              context,'/notificationAndSoundsPage');
        },
      ),
      ListTile(
        title: Text(
          "Privacy and Security",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(
              context,'/privacyAndSecurityPage');
        },
      ),
      ListTile(
        title: Text(
          "Data and Storage",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(
              context,'/dataAndStoragePage');
        },
      ),
      ListTile(
        title: Text(
          "Chat Background",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(
              context,'/chatBackgroundPage');
        },
      ),
      ListTile(
        title: Text(
          "Theme",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(
              context,'/themePage');
        },
      ),
      ListTile(
        title: Text(
          "Language",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(
              context,'/languagesPage');
        },
      ),
      StreamBuilder(
        stream: bloc.enableAnimation,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Enable Amimation",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.enableAnimation, newValue);
              bloc.setAnimationEnabled(newValue);
            },
            value: snapshot.data == null
                ? (bloc.enableAnimationStream.value == null
                    ? false
                    : bloc.enableAnimationStream.value)
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      SettingGroupTitle(
        "Messages",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      StreamBuilder(
        stream: bloc.inAppBrowser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "In-App Browser",
            subTitle: "Open External links with in app",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.inAppBrowser, newValue);
              bloc.setInAppBrowser(newValue);
            },
            value: snapshot.data == null
                ? (bloc.inAppBrowserStream.value == null
                    ? false
                    : bloc.inAppBrowserStream.value)
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      StreamBuilder(
        stream: bloc.directShare,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Direct Share",
            subTitle: "Show recent chats in share menu",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.directShare, newValue);
              bloc.setDirectShare(newValue);
            },
            value: snapshot.data == null
                ? (bloc.directShareStream.value == null
                    ? false
                    : bloc.directShareStream.value)
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      ListTile(
        title: Text(
          "Stickers",
          style: Theme.of(context).textTheme.body2,
        ),
      ),
      StreamBuilder(
          stream: bloc.messageTextSizeStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListTile(
              onTap: () async {
                await showDialog<int>(
                    context: context,
                    builder: (BuildContext context) =>
                        picker.NumberPickerDialog.integer(
                          title: Text("Message Text Size",
                              style: Theme.of(context).textTheme.body2),
                          minValue: 11,
                          maxValue: 30,
                          initialIntegerValue: snapshot.data == null
                              ? (bloc.messageTextSizeStream.value == null
                                  ? 11
                                  : bloc.messageTextSizeStream.value)
                              : snapshot.data,
                          infiniteLoop: true,
                        )).then((num value) {
                  if (value != null) {
                    bloc.setMessageTextSize(value);
                    PreferenceHandler.setPreference(PreferenceHandler.messageTextSize, value);
                  }
                });
              },
              title:
                  Text("Message Text Size", style: Theme.of(context).textTheme.body2),
              trailing: Text(
                "${snapshot.data}",
                style: TextStyle(color: Colors.blue),
              ),
            );
          }),
      StreamBuilder(
        stream: bloc.raiseToSpeak,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Raise to Speak",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.raiseToSpeak, newValue);
              bloc.setRaiseToSpeak(newValue);
            },
            value: snapshot.data == null
                ? (bloc.raiseToSpeakStream.value == null
                    ? false
                    : bloc.raiseToSpeakStream.value)
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      StreamBuilder(
        stream: bloc.sendByEnter,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Send by Enter",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.sendByEnter, newValue);
              bloc.setSendByEnter(newValue);
            },
            value: snapshot.data == null
                ? bloc.sendByEnterStream.value == null
                    ? false
                    : bloc.sendByEnterStream.value
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      StreamBuilder(
        stream: bloc.autoPlayGif,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Autoplay GIFs",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.autoPlayGIF, newValue);
              bloc.setAutoPlayGif(newValue);
            },
            value: snapshot.data == null
                ? bloc.autoPlayGifStream.value == null
                    ? false
                    : bloc.autoPlayGifStream.value
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      StreamBuilder(
        stream: bloc.saveToGallery,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Save to Gallery",
            onChanged: (bool newValue) {
              PreferenceHandler.setPreference(PreferenceHandler.saveToGallery, newValue);
              bloc.setSaveToGallery(newValue);
            },
            value: snapshot.data == null
                ? bloc.saveToGalleryStream.value == null
                    ? false
                    : bloc.saveToGalleryStream.value
                : snapshot.data,
            themeData: Theme.of(context),
          );
        },
      ),
      SettingGroupTitle(
        "Supports",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      ListTile(
          title: Text(
        "Ask a question",
        style: Theme.of(context).textTheme.body2,
      )),
      ListTile(
          title: Text(
        "Telegraph FAQ",
        style: Theme.of(context).textTheme.body2,
      )),
      ListTile(
          title: Text(
        "Privacy Policy",
        style: Theme.of(context).textTheme.body2,
      )),
    ]).toList());
  }

  String getOnlineString() {
    if (online)
      return "Online";
    else
      return "last seen 08:22 AM"; //TODO replace hard coded time string with actually last seen data
  }

  void onPopUpSelected(int selectedValue, BuildContext context) {
    if (selectedValue == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              title: Text("Information"),
              content: Text(
                "Are you sure you want to reset to default settings",
                style: Theme.of(context).textTheme.body1,
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () {
                      Assistant.setUpDefaults();

                      /// Return to home page?
                      Navigator.pop(context);
                    },
                    child: Text("Ok")),
              ],
            );
          });
    } else if (selectedValue == 2) {
    } else if (selectedValue == 3) {
      Navigator.pushReplacementNamed(
          context,'/firstPage');
    }
  }
}
