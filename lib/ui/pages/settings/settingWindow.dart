import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/settingBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/ui/customWidgets/myPhotoView.dart';
import 'package:Telegraph/ui/customWidgets/mySwitchListTile.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/infoDisplay.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:Telegraph/ui/pages/login/firstPage.dart';
import 'package:Telegraph/ui/pages/settings/info/changePhoneNumber.dart';
import 'package:Telegraph/ui/pages/settings/info/changeUsername.dart';
import 'package:Telegraph/ui/pages/settings/settings/chatBackground.dart';
import 'package:Telegraph/ui/pages/settings/settings/dataAndStorage.dart';
import 'package:Telegraph/ui/pages/settings/settings/languages.dart';
import 'package:Telegraph/ui/pages/settings/settings/notificationAndSound.dart';
import 'package:Telegraph/ui/pages/settings/settings/privacyAndSecurity/privacyAndSecurity.dart';
import 'package:Telegraph/ui/pages/settings/settings/theme.dart';
import 'package:numberpicker/numberpicker.dart' as picker;
import 'package:Telegraph/ui/customWidgets/myImageView.dart';

class SettingWindow extends StatelessWidget {
  final String imageURL = "assets/avatar_1.png";
  final String userName = "Miki";
  final String userString = "@MIKI_YAS";
  final String phoneNumber = "+251 941135730";
  final bool online = false;
  final bool enableAnimation = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
        blocFactory: () => SettingBloc(),
        builder: (BuildContext context, bloc) {
          final instance = SharedPreferenceHandler.getInstance();
          instance
              .isAnimationEnabled()
              .then((newValue) => bloc.setAnimationEnabled(newValue));
          instance
              .isInAppBrowser()
              .then((newValue) => bloc.setInAppBrowser(newValue));
          instance
              .isDirectShare()
              .then((newValue) => bloc.setDirectShare(newValue));
          instance
              .getMessageTextSize()
              .then((newValue) => bloc.setMessageTextSize(newValue));
          instance
              .getRaiseToSpeak()
              .then((newValue) => bloc.setRaiseToSpeak(newValue));
          instance
              .getSendByEnter()
              .then((newValue) => bloc.setSendByEnter(newValue));
          instance
              .getAutoPlayGIF()
              .then((newValue) => bloc.setAutoPlayGif(newValue));
          instance
              .getSaveToGallery()
              .then((newValue) => bloc.setSaveToGallery(newValue));
          return MaterialApp(
              title: 'Setting',
              home: Scaffold(
                body: NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool) => [
                          SliverAppBar(
                            expandedHeight: 150,
                            pinned: true,
                            leading: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            flexibleSpace: FlexibleSpaceBar(
                                titlePadding: EdgeInsets.only(
                                    top: 15, left: 70, bottom: 3),
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
                                                    builder: (BuildContext
                                                            context) =>
                                                        MyPhotoView(imageURL)));
                                          },
                                        ),
                                        padding: EdgeInsets.only(right: 5)),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          userName,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          getOnlineString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            actions: <Widget>[
                              PopupMenuButton(
                                onSelected: (selectedValue) {
                                  if (selectedValue == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                FirstPage()));
                                  }
                                },
                                itemBuilder: (context) {
                                  return getMenu();
                                },
                              )
                            ],
                          )
                        ],
                    body: getBody(context, bloc)),
              ));
        });
  }

  List<PopupMenuEntry> getMenu() {
    List<String> menuListString = [
      'Edit name',
      'Log out',
    ];
    List<PopupMenuEntry> menuList = [];
    int i = 0;
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(value: i, child: Text(menu)));
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangePhoneNumber()));
        },
      ),
      InfoDisplay(userString, "Username", onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChangeUserName()));
      }),
      SettingGroupTitle(
        "Settings",
        false,
        top: 20,
        left: 15,
        bottom: 5,
      ),
      ListTile(
        title: Text("Notification and Sounds"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NotificationAndSounds()));
        },
      ),
      ListTile(
        title: Text("Privacy and Security"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyAndSecurity()));
        },
      ),
      ListTile(
        title: Text("Data and Storage"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DataAndStorage()));
        },
      ),
      ListTile(
        title: Text("Chat Background"),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatBackground()));
        },
      ),
      ListTile(
        title: Text("Theme"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyTheme()));
        },
      ),
      ListTile(
        title: Text("Language"),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Languages()));
        },
      ),
      StreamBuilder(
        stream: bloc.enableAnimation,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Enable Amimation",
            onChanged: (bool newValue) {
              SharedPreferenceHandler.getInstance()
                  .setEnableAnimation(newValue);
              bloc.setAnimationEnabled(newValue);
            },
            value: snapshot.data == null
                ? (bloc.enableAnimationStream.value == null
                    ? false
                    : bloc.enableAnimationStream.value)
                : snapshot.data,
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
              SharedPreferenceHandler.getInstance().setInAppBrowser(newValue);
              bloc.setInAppBrowser(newValue);
            },
            value: snapshot.data == null
                ? bloc.inAppBrowserStream.value
                : snapshot.data,
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
              SharedPreferenceHandler.getInstance().setInAppBrowser(newValue);
              bloc.setDirectShare(newValue);
            },
            value: snapshot.data == null
                ? bloc.directShareStream.value
                : snapshot.data,
          );
        },
      ),
      ListTile(
        title: Text("Stickers"),
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
                          title: Text(
                            "Message Text Size",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          minValue: 11,
                          maxValue: 30,
                          initialIntegerValue: snapshot.data == null
                              ? bloc.messageTextSizeStream.value
                              : snapshot.data,
                          infiniteLoop: true,
                        )).then((num value) {
                  if (value != null) {
                    bloc.setMessageTextSize(value);
                    SharedPreferenceHandler.getInstance()
                        .setMessageTextSize(value);
                  }
                });
              },
              title: Text("Message Text Size"),
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
              SharedPreferenceHandler.getInstance().setRaiseToSpeak(newValue);
              bloc.setRaiseToSpeak(newValue);
            },
            value: snapshot.data == null
                ? bloc.raiseToSpeakStream.value
                : snapshot.data,
          );
        },
      ),
      StreamBuilder(
        stream: bloc.sendByEnter,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Send by Enter",
            onChanged: (bool newValue) {
              SharedPreferenceHandler.getInstance().setSendByEnter(newValue);
              bloc.setSendByEnter(newValue);
            },
            value: snapshot.data == null
                ? bloc.sendByEnterStream.value
                : snapshot.data,
          );
        },
      ),
      StreamBuilder(
        stream: bloc.autoPlayGif,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Autoplay GIFs",
            onChanged: (bool newValue) {
              SharedPreferenceHandler.getInstance().setAutoPlayGIF(newValue);
              bloc.setAutoPlayGif(newValue);
            },
            value: snapshot.data == null
                ? bloc.autoPlayGifStream.value
                : snapshot.data,
          );
        },
      ),
      StreamBuilder(
        stream: bloc.saveToGallery,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Save to Gallery",
            onChanged: (bool newValue) {
              SharedPreferenceHandler.getInstance().setSaveToGallery(newValue);
              bloc.setSaveToGallery(newValue);
            },
            value: snapshot.data == null
                ? bloc.saveToGalleryStream.value
                : snapshot.data,
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
      ListTile(title: Text("Ask a question")),
      ListTile(title: Text("Telegraph FAQ")),
      ListTile(title: Text("Privacy Policy")),
    ]).toList());
  }

  String getOnlineString() {
    if (online)
      return "Online";
    else
      return "last seen 08:22 AM"; //TODO replace hard coded time string with actually last seen data
  }
// TODO Consider Using preferences library
}
