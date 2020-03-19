import 'package:flutter/material.dart';

class SettingWindow extends StatefulWidget {
  final SettingWindowState settingWindow;

  SettingWindow() : settingWindow = SettingWindowState();

  @override
  State<StatefulWidget> createState() {
    return settingWindow;
  }
}

class SettingWindowState extends State<SettingWindow> {
  String imageURL = "";
  String userName = "Miki";
  bool online = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Setting',
        home: Scaffold(
          appBar: AppBar(
            leading: FlatButton(
                textColor: Colors.white,
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: ListTile(
              leading: Image.asset(imageURL,width: 5,height: 5,),
              title: Align(child: Text(userName),alignment: Alignment(-1.2, 0),),
              subtitle: Text('$online'),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: null,
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ))
            ],
          ),
          body: ListView(),
        ));
  }
}
