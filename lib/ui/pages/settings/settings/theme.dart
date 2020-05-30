import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/themeBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/controll/others/myThemeData.dart';
import 'package:Telegraph/ui/customWidgets/circularContainer.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        blocFactory: () => ThemeBloc(),
        builder: (BuildContext context, ThemeBloc bloc) {
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
                "Theme",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            body: ListView(
              children: <Widget>[
                FlatButton(
                    color: Theme.of(context).buttonColor,
                    onPressed: () {},
                    child: Text(
                      "Create New Theme",
                      style: Theme.of(context).textTheme.body2,
                    )),
                Card(
                  margin: EdgeInsets.all(0),
                  shape: BeveledRectangleBorder(),
                  color: Theme.of(context).cardColor,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: Text(
                        "You can create your own theme by changing the colors within the app. You can always switch back to the default Telegraph theme here.",
                        style: Theme.of(context).textTheme.caption,
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
                          style: Theme.of(context).textTheme.body2,
                        ),
                        trailing: snapshot.data == MyThemeData.defaultLight
                            ? getMarkedIcon()
                            : null,
                        onTap: () {
                          bloc.setSelectedThemeData(
                              bloc.mapStringToThemeData("DefaultLight"));
                          PreferenceHandler.setPreference<String>(
                              PreferenceHandler.selectedTheme, "DefaultLight");
                          Navigator.pushReplacementNamed(
                            context,
                            '/',
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
                          style: Theme.of(context).textTheme.body2,
                        ),
                        trailing: snapshot.data == MyThemeData.defaultDark
                            ? getMarkedIcon()
                            : null,
                        onTap: () {
                          bloc.setSelectedThemeData(
                              bloc.mapStringToThemeData("DefaultDark"));
                          PreferenceHandler.setPreference<String>(
                              PreferenceHandler.selectedTheme, "DefaultDark");
                          Navigator.pushReplacementNamed(
                            context,
                            '/',
                          );
                        },
                      );
                    }),
                StreamBuilder(
                    stream: bloc.selectedThemeStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListTile(
                        leading: CircularContainer(
                            backGroundColor: MyThemeData.darkBlue.primaryColor),
                        title: Text(
                          "Dark Blue",
                          style: Theme.of(context).textTheme.body2,
                        ),
                        trailing: snapshot.data == MyThemeData.darkBlue
                            ? getMarkedIcon()
                            : null,
                        onTap: () {
                          bloc.setSelectedThemeData(
                              bloc.mapStringToThemeData("DarkBlue"));
                          PreferenceHandler.setPreference<String>(
                              PreferenceHandler.selectedTheme, "DarkBlue");
                          Navigator.pushReplacementNamed(
                            context,
                            '/',
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
                          style: Theme.of(context).textTheme.body2,
                        ),
                        trailing: snapshot.data == MyThemeData.defaultLerp
                            ? getMarkedIcon()
                            : null,
                        onTap: () {
                          bloc.setSelectedThemeData(
                              bloc.mapStringToThemeData("DefaultLerp"));
                          PreferenceHandler.setPreference<String>(
                              PreferenceHandler.selectedTheme, "DefaultLerp");
                          Navigator.pushReplacementNamed(
                            context,
                            '/',
                          );
                        },
                      );
                    }),
              ],
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
