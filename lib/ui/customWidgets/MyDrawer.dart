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

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      color: Colors.white,
                    ),
                    onPressed: () {}))
          ],
          accountName: Text('$userName'),
          accountEmail: Text('$countryCode $phoneNumber'),
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
          leading: Icon(Icons.people),
          title: Text('New Group'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NewGroupAndSecretChat("New Group")));
          },
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('New Secret Chat'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NewGroupAndSecretChat("New Secret Chat")));
          },
        ),
        ListTile(
          leading: Icon(Icons.volume_up),
          title: Text('New Channel'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ChannelDescription()));
          },
        ),
        Divider(
          thickness: 2,
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contacts'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.call),
          title: Text('Calls'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.person_add),
          title: Text('Invite Friends'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingWindow()));
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Telegraph FAQ'),
          onTap: () {},
        ),
      ],
    ));
  }
}
