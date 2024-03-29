import '../../../blocs/provider/provider.dart';
import '../../../blocs/setting/settingBloc.dart';
import '../../../others/assistant.dart';
import '../../../core/utils/preferenceKeys.dart';
import '../../../ui/customWidgets/checkingAlertDialog.dart';
import 'package:flutter/material.dart';
import '../../../ui/customWidgets/mySwitchListTile.dart';
import '../../../ui/customWidgets/infoDisplay.dart';
import '../../../ui/customWidgets/settingGroupTitle.dart';
import 'package:numberpicker/numberpicker.dart' as picker;
import '../../../ui/customWidgets/myImageView.dart';

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
          bloc.setAnimationEnabled(
              PreferenceKeys.getPreference(PreferenceKeys.enableAnimation));
          bloc.setInAppBrowser(
              PreferenceKeys.getPreference(PreferenceKeys.inAppBrowser));
          bloc.setDirectShare(
              PreferenceKeys.getPreference(PreferenceKeys.directShare));
          bloc.setMessageTextSize(
              PreferenceKeys.getPreference(PreferenceKeys.messageTextSize));
          bloc.setRaiseToSpeak(
              PreferenceKeys.getPreference(PreferenceKeys.raiseToSpeak));
          bloc.setSendByEnter(
              PreferenceKeys.getPreference(PreferenceKeys.sendByEnter));
          bloc.setAutoPlayGif(
              PreferenceKeys.getPreference(PreferenceKeys.autoPlayGIF));
          bloc.setSaveToGallery(
              PreferenceKeys.getPreference(PreferenceKeys.saveToGallery));

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
                                      child: MyImageView(imageURL: imageURL),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/photoViewPage');
                                      },
                                    ),
                                    padding: EdgeInsets.only(right: 5)),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      userName,
                                      style:
                                          Theme.of(context).textTheme.subtitle,
                                    ),
                                    Text(
                                      getOnlineString(),
                                      style:
                                          Theme.of(context).textTheme.caption,
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
          value: i,
          child: Text(menu, style: Theme.of(context).textTheme.body2)));
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
          Navigator.pushNamed(context, '/changePhoneNumberPage');
        },
        themeData: Theme.of(context),
      ),
      InfoDisplay(
        userString,
        "Username",
        onTap: () {
          Navigator.pushNamed(context, '/changeUserNamePage');
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
          Navigator.pushNamed(context, '/notificationAndSoundsPage');
        },
      ),
      ListTile(
        title: Text(
          "Privacy and Security",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/privacyAndSecurityPage');
        },
      ),
      ListTile(
        title: Text(
          "Data and Storage",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/dataAndStoragePage');
        },
      ),
      ListTile(
        title: Text(
          "Chat Background",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/chatBackgroundPage');
        },
      ),
      ListTile(
        title: Text(
          "Theme",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/themePage');
        },
      ),
      ListTile(
        title: Text(
          "Language",
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () {
          Navigator.pushNamed(context, '/languagesPage');
        },
      ),
      StreamBuilder(
        stream: bloc.enableAnimation,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MySwitchListTile(
            title: "Enable Amimation",
            onChanged: (bool newValue) {
              PreferenceKeys.setPreference(
                  PreferenceKeys.enableAnimation, newValue);
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
              PreferenceKeys.setPreference(
                  PreferenceKeys.inAppBrowser, newValue);
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
              PreferenceKeys.setPreference(
                  PreferenceKeys.directShare, newValue);
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
                    PreferenceKeys.setPreference(
                        PreferenceKeys.messageTextSize, value);
                  }
                });
              },
              title: Text("Message Text Size",
                  style: Theme.of(context).textTheme.body2),
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
              PreferenceKeys.setPreference(
                  PreferenceKeys.raiseToSpeak, newValue);
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
              PreferenceKeys.setPreference(
                  PreferenceKeys.sendByEnter, newValue);
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
              PreferenceKeys.setPreference(
                  PreferenceKeys.autoPlayGIF, newValue);
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
              PreferenceKeys.setPreference(
                  PreferenceKeys.saveToGallery, newValue);
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
            return CheckingAlertDialog(
              message: " Are you sure you want to reset to defaults?",
              onCancelClicked: () {
                Navigator.pop(context);
              },
              onOkClicked: () {
                Assistant.setUpDefaults();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/homePage', (Route<dynamic> route) => false);
              },
            );
          });
    } else if (selectedValue == 2) {
    } else if (selectedValue == 3) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CheckingAlertDialog(
              message: "Are you sure you want to logout?",
              onCancelClicked: () {
                Navigator.pop(context);
              },
              onOkClicked: () {
                PreferenceKeys.setPreference<bool>(
                    PreferenceKeys.isLoggedIn, false);
                Assistant.setUpDefaults();//TODO to be replaced
                Navigator.pushNamedAndRemoveUntil(
                    context, '/firstPage', (Route<dynamic> route) => false);
              },
            );
          });
    }
  }
}
