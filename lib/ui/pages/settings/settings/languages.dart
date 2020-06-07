import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:flutter/material.dart';

class LanguagesPage extends StatelessWidget {
  final snackBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        key: snackBarKey,
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
            "Languages",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView(
            children:
                ListTile.divideTiles(context: context, tiles: getLanguageList(context))
                    .toList()),
      );
  }

  List<Widget> getLanguageList(BuildContext context) {
    List<Widget> languageWidget = List<Widget>();
    List languages = ['Amharic', 'English'];
    for (String language in languages) {
      languageWidget.add(ListTile(
        title: Text(
          language,
          style: Theme.of(context).textTheme.body2,
        ),
        onTap: () async {
          bool languageUpdated = await PreferenceKeys.setPreference(PreferenceKeys.language, language);
          if (languageUpdated) {
            SnackBar snackBar = SnackBar(
                backgroundColor: Theme.of(context).backgroundColor,
                content: Text(
                  'Language Updated to $language',
                  style: Theme.of(context).textTheme.body2,
                ));
            snackBarKey.currentState.showSnackBar(snackBar);
          }
        },
      ));
    }
    return languageWidget;
  }
}
