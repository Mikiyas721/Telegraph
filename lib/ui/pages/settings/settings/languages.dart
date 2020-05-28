import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  final snackBarKey = GlobalKey<ScaffoldState>();
  final ThemeData themeData;

  Languages({this.themeData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Languages",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        key: snackBarKey,
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
            "Languages",
            style: themeData.textTheme.title,
          ),
        ),
        body: ListView(
            children:
                ListTile.divideTiles(context: context, tiles: getLanguageList())
                    .toList()),
      ),
    );
  }

  List<Widget> getLanguageList() {
    List<Widget> languageWidget = List<Widget>();
    List languages = ['Amharic', 'English'];
    for (String language in languages) {
      languageWidget.add(ListTile(
        title: Text(
          language,
          style: themeData.textTheme.body2,
        ),
        onTap: () async {
          bool languageUpdated = await SharedPreferenceHandler.getInstance()
              .setAppLanguage(language);
          if (languageUpdated) {
            SnackBar snackBar = SnackBar(
                backgroundColor: themeData.backgroundColor,
                content: Text(
                  'Language Updated to $language',
                  style: themeData.textTheme.body2,
                ));
            snackBarKey.currentState.showSnackBar(snackBar);
          }
        },
      ));
    }
    return languageWidget;
  }
}
