import 'package:Telegraph/ui/customWidgets/myPhotoView.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/news/channelDescription.dart';
import 'package:Telegraph/ui/pages/news/newGroup.dart';
import 'package:Telegraph/ui/pages/settings/settings.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';

class MyDrawer extends StatelessWidget {
  final String userName = 'Mikiyas';
  final String countryCode = '+251';
  final String phoneNumber = '941135730';
  final String profilePictureURL = "assets/chatBackground_3.jpeg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  otherAccountsPictures: <Widget>[
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.cloud,
                                color:Theme.of(context).iconTheme.color
                            ),
                            onPressed: () {}))
                  ],
                  accountName: Text('$userName', style: Theme.of(context).textTheme.title,),
                  accountEmail: Text('$countryCode $phoneNumber',style: Theme.of(context).textTheme.subtitle,),
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
                  leading: Icon(Icons.people,color:Theme.of(context).iconTheme.color),
                  title: Text('New Group',
                      style: Theme.of(context).textTheme.body2),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NewGroupPage("New Group")));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock,color:Theme.of(context).iconTheme.color),
                  title: Text('New Secret Chat',style: Theme.of(context).textTheme.body2,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NewGroupPage("New Secret Chat")));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.volume_up,color:Theme.of(context).iconTheme.color),
                  title: Text('New Channel',style: Theme.of(context).textTheme.body2,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChannelDescriptionPage()));
                  },
                ),
                Divider(
                  thickness: 2,color: Theme.of(context).primaryColor,
                ),
                ListTile(
                  leading: Icon(Icons.contacts,color:Theme.of(context).iconTheme.color),
                  title: Text('Contacts',style: Theme.of(context).textTheme.body2,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.call,color:Theme.of(context).iconTheme.color),
                  title: Text('Calls',style: Theme.of(context).textTheme.body2,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.person_add,color:Theme.of(context).iconTheme.color),
                  title: Text('Invite Friends',style: Theme.of(context).textTheme.body2,),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings,color:Theme.of(context).iconTheme.color),
                  title: Text('Settings',style: Theme.of(context).textTheme.body2,),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help,color:Theme.of(context).iconTheme.color),
                  title: Text('Telegraph FAQ',style: Theme.of(context).textTheme.body2,),
                  onTap: () {},
                ),
              ],
            )));
  }
}
