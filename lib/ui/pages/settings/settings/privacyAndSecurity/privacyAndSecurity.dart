import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/securityBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/ui/customWidgets/dialogMenu.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:flutter/material.dart';

class PrivacyAndSecurityPage extends StatelessWidget {
  final List<String> menus = ["Everybody", "My Contacts", "Nobody"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecurityBloc>(
      blocFactory: () => SecurityBloc(),
      builder: (BuildContext context, SecurityBloc bloc) {
        bloc.setLastSeen(
            PreferenceHandler.getPreference(PreferenceHandler.whoViewLastSeen));
        bloc.setCalls(
            PreferenceHandler.getPreference(PreferenceHandler.whoCanCallMe));
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              "Privacy and Security",
              style: Theme.of(context).textTheme.title,
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
                title: Text(
                  "Blocked Users",
                  style: Theme.of(context).textTheme.body2,
                ),
                onTap: () {},
              ),
              StreamBuilder(
                  stream: bloc.lastSeenStream,
                  builder: (BuildContext context, AsyncSnapshot snapShot) {
                    return ListTile(
                      title:
                          Text("Last Seen", style: Theme.of(context).textTheme.body2),
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
                                  preferenceKey:
                                      PreferenceHandler.whoViewLastSeen,
                                  themeData: Theme.of(context),
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
                      title: Text("Calls", style: Theme.of(context).textTheme.body2),
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
                                  preferenceKey: PreferenceHandler.whoCanCallMe,
                                  themeData: Theme.of(context),
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
                title: Text("Passcode Lock", style: Theme.of(context).textTheme.body2),
                onTap: () {
                  Navigator.pushNamed(
                      context,'/passwordEnteringPage');
                },
              ),
              ListTile(
                title: Text("Two-Step Verification",
                    style: Theme.of(context).textTheme.body2),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
