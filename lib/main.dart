import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/themeBloc.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/resources/myThemeData.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/login/firstPage.dart';
import 'ui/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool loggedIn = true;
  Widget startingPage;

  MyApp() {
    if (loggedIn)
      startingPage = HomePage();
    else
      startingPage = FirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        blocFactory: () => ThemeBloc(),
        builder: (BuildContext context, ThemeBloc bloc) {
          SharedPreferenceHandler.getInstance()
              .getSelectedTheme()
              .then(bloc.setSelectedTheme);
          return StreamBuilder(
              stream: bloc.selectedTheme,
              builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: snapshot.data == null
                      ? (bloc.selectedTheme == null
                          ? MyThemeData.defaultTheme
                          : bloc.selectedTheme)
                      : snapshot.data,
                  home: startingPage,
                );
              });
        });
  }
}
