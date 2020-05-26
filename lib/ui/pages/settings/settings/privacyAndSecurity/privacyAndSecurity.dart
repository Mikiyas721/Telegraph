import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/securityBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
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
        SharedPreferenceHandler instance =
            SharedPreferenceHandler.getInstance();
        instance.getWhoViewLastSeen().then((savedValue) {
          bloc.setLastSeen(savedValue);
        });
        instance.getWhoCanCallMe().then((savedValue) {
          bloc.setCalls(savedValue);
        });
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
                            "${snapShot.data == null ? (bloc.lastSeenStream.value == null ? "Nobody" : bloc.lastSeenStream.value) : snapShot.data}",
                            style: TextStyle(color: Colors.blue)),
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => DialogMenu(
                                    title: "Who can See your last seen time?",
                                    menus: menus,
                                    selectedValue: snapShot.data == null
                                        ? (bloc.lastSeenStream.value == null
                                            ? "Nobody"
                                            : bloc.lastSeenStream.value)
                                        : snapShot.data,
                                    parentSink: bloc.setLastSeen,
                                    sharedPreferenceSink:
                                        SharedPreferenceHandler.getInstance()
                                            .setWhoViewLastSeen,
                                  )).then((selectedValue) {
                            if (selectedValue != null) {
                              bloc.setLastSeen(selectedValue);

                              /// Check these out promise callbacks
                            }
                          });
                        },
                      );
                    }),
                StreamBuilder(
                    stream: bloc.callStream,
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                      return ListTile(
                        title: Text("Calls"),
                        trailing: Text(
                          "${snapShot.data == null ? (bloc.callStream.value == null ? "Nobody" : bloc.callStream.value) : snapShot.data}",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => DialogMenu(
                                    title: "Who can call me?",
                                    menus: menus,
                                    selectedValue: snapShot.data == null
                                        ? (bloc.callStream.value == null
                                            ? "Nobody"
                                            : bloc.callStream.value)
                                        : snapShot.data,
                                    parentSink: bloc.setCalls,
                                    sharedPreferenceSink:
                                        SharedPreferenceHandler.getInstance()
                                            .setWhoCanCallMe,
                                  )).then((selectedValue) async {
                            if (selectedValue != null) {
                              bloc.setCalls(selectedValue);
                            }
                          });
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
