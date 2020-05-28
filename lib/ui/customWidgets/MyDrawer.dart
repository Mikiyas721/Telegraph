import 'package:Telegraph/ui/customWidgets/myPhotoView.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/news/channelDescription.dart';
import 'package:Telegraph/ui/pages/news/newGroup.dart';
import 'package:Telegraph/ui/pages/settings/settingWindow.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';

class MyDrawer extends StatelessWidget {
  final String userName = 'Mikiyas';
  final String countryCode = '+251';
  final String phoneNumber = '941135730';
  final String profilePictureURL = "assets/chatBackground_3.jpeg";
  final ThemeData themeData;

  MyDrawer({this.themeData});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: themeData.scaffoldBackgroundColor,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor,
                  ),
                  otherAccountsPictures: <Widget>[
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeData.primaryColorDark,
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.cloud,
                                color:themeData.iconTheme.color
                            ),
                            onPressed: () {}))
                  ],
                  accountName: Text('$userName', style: themeData.textTheme.title,),
                  accountEmail: Text('$countryCode $phoneNumber',style: themeData.textTheme.subtitle,),
                  currentAccountPicture: GestureDetector(
                    child: MyImageView(profilePictureURL),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyPhotoView(profilePictureURL)));
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.people,color:themeData.iconTheme.color),
                  title: Text('New Group',
                      style: themeData.textTheme.body2),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NewGroupAndSecretChat("New Group",themeData:themeData)));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock,color:themeData.iconTheme.color),
                  title: Text('New Secret Chat',style: themeData.textTheme.body2,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NewGroupAndSecretChat("New Secret Chat",themeData:themeData)));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.volume_up,color:themeData.iconTheme.color),
                  title: Text('New Channel',style: themeData.textTheme.body2,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChannelDescription(themeData:themeData)));
                  },
                ),
                Divider(
                  thickness: 2,color: themeData.primaryColor,
                ),
                ListTile(
                  leading: Icon(Icons.contacts,color:themeData.iconTheme.color),
                  title: Text('Contacts',style: themeData.textTheme.body2,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.call,color:themeData.iconTheme.color),
                  title: Text('Calls',style: themeData.textTheme.body2,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.person_add,color:themeData.iconTheme.color),
                  title: Text('Invite Friends',style: themeData.textTheme.body2,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings,color:themeData.iconTheme.color),
                  title: Text('Settings',style: themeData.textTheme.body2,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingWindow(themeData:themeData)));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help,color:themeData.iconTheme.color),
                  title: Text('Telegraph FAQ',style: themeData.textTheme.body2,),
                  onTap: () {},
                ),
              ],
            )));
  }
}
