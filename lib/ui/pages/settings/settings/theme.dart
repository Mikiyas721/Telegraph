import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/themeBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/ui/customWidgets/circularContainer.dart';
import 'package:flutter/material.dart';

class MyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        blocFactory: () => ThemeBloc(),
        builder: (BuildContext context, ThemeBloc bloc) {
          SharedPreferenceHandler sharedPreference =
          SharedPreferenceHandler.getInstance();
          sharedPreference.getSelectedTheme().then((selectedValue) {
            bloc.setSelectedTheme(selectedValue);
          });
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  "Theme",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    child: FlatButton(
                        onPressed: () {}, child: Text("Create New Theme")),
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: BeveledRectangleBorder(),
                    color: Color(0xD3D3D3),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Text(
                          "You can create your own theme by changing the colors within the app. You can always switch back to the default Telegraph theme here.",
                          style: TextStyle(color: Colors.black54),
                        )),
                  ),
                  StreamBuilder(
                      stream: bloc.selectedThemeStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          leading:
                          CircularContainer(backGroundColor: Colors.blue),
                          title: Text("Default"),
                          trailing: snapshot.data == "Default"
                              ? getMarkedIcon()
                              : (bloc.selectedThemeStream.value == "Default"
                              ? getMarkedIcon()
                              : null),
                          onTap: () {
                            bloc.setSelectedTheme("Default");
                            print("Writing Default");
                            sharedPreference.setSelectedTheme("Default");
                          },
                        );
                      }),
                  StreamBuilder(
                      stream: bloc.selectedThemeStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          leading: CircularContainer(
                              backGroundColor: Colors.black54),
                          title: Text("Dark"),
                          trailing: snapshot.data == "Dark"
                              ? getMarkedIcon()
                              : bloc.selectedThemeStream.value == "Dark"
                              ? getMarkedIcon()
                              : null,
                          onTap: () {
                            bloc.setSelectedTheme("Dark");
                            print("Writing Dark");
                            sharedPreference.setSelectedTheme("Dark");
                          },
                        );
                      })
                ],
              ),
            ),
          );
        });
  }

  Icon getMarkedIcon() {
    return Icon(
      Icons.check,
      color: Colors.blue,
    );
  }
}
