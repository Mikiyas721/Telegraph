import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/dialogMenu.dart';
import 'package:telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:telegraph/ui/pages/settings/settings/privacyAndSecurity/passwordPrompt.dart';

class PrivacyAndSecurity extends StatelessWidget {
  final List<String> menus = ["Everybody", "My Contacts", "Nobody"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Privacy and Security",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Privacy and Security",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: ListView(
          children: <Widget>[
            SettingGroupTitle("Privacy",top: 15,left: 15,),
            ListTile(
              title: Text("Blocked Users"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Last Seen"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        DialogMenu("Who can See your last seen time?", menus));
              },
            ),
            ListTile(
              title: Text("Calls"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        DialogMenu("Who can call me?", menus));
              },
            ),
            SettingGroupTitle("Security",left: 15),
            ListTile(
              title: Text("Passcode Lock"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PasswordPrompt()));
              },
            ),
            ListTile(
              title: Text("Two-Step Verification"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
