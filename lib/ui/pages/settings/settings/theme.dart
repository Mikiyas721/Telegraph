import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/themeBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/main.dart';
import 'package:Telegraph/controll/others/myThemeData.dart';
import 'package:Telegraph/ui/customWidgets/circularContainer.dart';
import 'package:flutter/material.dart';

class MyTheme extends StatelessWidget {
  final ThemeData themeData;

  MyTheme({this.themeData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        blocFactory: () => ThemeBloc(),
        builder: (BuildContext context, ThemeBloc bloc) {
          SharedPreferenceHandler sharedPreference =
              SharedPreferenceHandler.getInstance();
          sharedPreference.getSelectedTheme().then((selectedValue) {
            bloc.setSelectedThemeData(bloc.mapStringToThemeData(selectedValue));
          });
          return MaterialApp(
            home: Scaffold(
              backgroundColor: themeData.scaffoldBackgroundColor,
              appBar: AppBar(
                backgroundColor: themeData.primaryColor,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: themeData.iconTheme.color,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  "Theme",
                  style: themeData.textTheme.title,
                ),
              ),
              body: ListView(
                children: <Widget>[
                  FlatButton(
                      color: themeData.buttonColor,
                      onPressed: () {},
                      child: Text(
                        "Create New Theme",
                        style: themeData.textTheme.body2,
                      )),
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: BeveledRectangleBorder(),
                    color: themeData.cardColor,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Text(
                          "You can create your own theme by changing the colors within the app. You can always switch back to the default Telegraph theme here.",
                          style: themeData.textTheme.caption,
                        )),
                  ),
                  StreamBuilder(
                      stream: bloc.selectedThemeData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          leading: CircularContainer(
                              backGroundColor:
                                  MyThemeData.defaultLight.primaryColor),
                          title: Text(
                            "Light",
                            style: themeData.textTheme.body2,
                          ),
                          trailing: snapshot.data == MyThemeData.defaultLight
                              ? getMarkedIcon()
                              : null,
                          onTap: () {
                            bloc.setSelectedThemeData(
                                bloc.mapStringToThemeData("DefaultLight"));
                            sharedPreference.setSelectedTheme("DefaultLight");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyApp()),
                            );
                          },
                        );
                      }),
                  StreamBuilder(
                      stream: bloc.selectedThemeStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          leading: CircularContainer(
                              backGroundColor:
                                  MyThemeData.defaultDark.primaryColor),
                          title: Text(
                            "Dark",
                            style: themeData.textTheme.body2,
                          ),
                          trailing: snapshot.data == MyThemeData.defaultDark
                              ? getMarkedIcon()
                              : null,
                          onTap: () {
                            bloc.setSelectedThemeData(
                                bloc.mapStringToThemeData("DefaultDark"));
                            sharedPreference.setSelectedTheme("DefaultDark");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => MyApp()),
                                );
                          },
                        );
                      }),
                  StreamBuilder(
                      stream: bloc.selectedThemeStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          leading: CircularContainer(
                              backGroundColor:
                                  MyThemeData.darkBlue.primaryColor),
                          title: Text(
                            "Dark Blue",
                            style: themeData.textTheme.body2,
                          ),
                          trailing: snapshot.data == MyThemeData.darkBlue
                              ? getMarkedIcon()
                              : null,
                          onTap: () {
                            bloc.setSelectedThemeData(
                                bloc.mapStringToThemeData("DarkBlue"));
                            sharedPreference.setSelectedTheme("DarkBlue");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => MyApp()),
                               );
                          },
                        );
                      }),
                  StreamBuilder(
                      stream: bloc.selectedThemeStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListTile(
                          leading: CircularContainer(
                              backGroundColor:
                                  MyThemeData.defaultLerp.primaryColor),
                          title: Text(
                            "Lerp",
                            style: themeData.textTheme.body2,
                          ),
                          trailing: snapshot.data == MyThemeData.defaultLerp
                              ? getMarkedIcon()
                              : null,
                          onTap: () {
                            bloc.setSelectedThemeData(
                                bloc.mapStringToThemeData("DefaultLerp"));
                            sharedPreference.setSelectedTheme("DefaultLerp");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => MyApp()),
                                );
                          },
                        );
                      }),
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
