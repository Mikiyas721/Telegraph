import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/securityBloc.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/dialogMenu.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:Telegraph/ui/pages/settings/settings/privacyAndSecurity/passwordPrompt.dart';

class PrivacyAndSecurity extends StatelessWidget {
  final List<String> menus = ["Everybody", "My Contacts", "Nobody"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecurityBloc>(
      blocFactory: () => SecurityBloc(),
      builder: (BuildContext context, SecurityBloc bloc) {
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
                SettingGroupTitle(
                  "Privacy",
                  false,
                  top: 15,
                  left: 15,
                ),
                ListTile(
                  title: Text("Blocked Users"),
                  onTap: () {},
                ),
                StreamBuilder(
                    stream: bloc.lastSeenStream,
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                      return ListTile(
                        title: Text("Last Seen"),
                        trailing: Text(
                            "${snapShot.data == null ? "My Contacts" : snapShot.data}",
                            style: TextStyle(color: Colors.blue)),
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => DialogMenu(
                                    title: "Who can See your last seen time?",
                                    menus: menus,
                                    selectedValue: "My Contacts",
                                    parentSink: bloc.setLastSeen,
                                  )).then(bloc.setLastSeen);
                        },
                      );
                    }),
                StreamBuilder(
                    stream: bloc.callStream,
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                      return ListTile(
                        title: Text("Calls"),
                        trailing: Text(
                          "${snapShot.data == null ? "My Contacts" : snapShot.data}",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => DialogMenu(
                                    title: "Who can call me?",
                                    menus: menus,
                                    selectedValue: "My Contacts",
                                    parentSink: bloc.setCalls,
                                  )).then(bloc.setCalls);
                        },
                      );
                    }),
                SettingGroupTitle("Security", false, left: 15),
                ListTile(
                  title: Text("Passcode Lock"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PasswordPrompt()));
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
      },
    );
  }
}
