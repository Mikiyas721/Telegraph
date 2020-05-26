import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  final snackBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Languages",
      home: Scaffold(
        key: snackBarKey,
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
            "Languages",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: ListView(
            children: ListTile.divideTiles(
                    context: context, tiles: getLanguageList())
                .toList()),
      ),
    );
  }

  List<Widget> getLanguageList() {
    List<Widget> languageWidget = List<Widget>();
    List languages = ['Amharic', 'English'];
    for (String language in languages) {
      languageWidget.add(ListTile(
        title: Text(language),
        onTap: () async {
          bool languageUpdated = await SharedPreferenceHandler.getInstance()
              .setAppLanguage(language);
          if (languageUpdated) {
            SnackBar snackBar =
                SnackBar(content: Text('Language Updated to $language'));
            snackBarKey.currentState.showSnackBar(snackBar);
          }
        },
      ));
    }
    return languageWidget;
  }
}
