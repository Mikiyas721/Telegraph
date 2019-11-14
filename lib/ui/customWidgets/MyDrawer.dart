import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String userName = 'Mikiyas';
  final String countryCode = '+251';
  final String phoneNumber = '941135730';

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('$userName'),
          accountEmail: Text('$countryCode $phoneNumber'),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('New Group'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('New Secret Chat'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.volume_up),
          title: Text('New Channel'),
          onTap: () {},
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
          onTap: () {},
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