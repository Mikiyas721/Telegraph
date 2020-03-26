import 'package:flutter/material.dart';
import 'package:telegraph/ui/customWidgets/settingGroupTitle.dart';

class DataAndStorage extends StatelessWidget {
  final String dataMediaDownload = "No Media";
  final String wifiMediaDownload = "No Media";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Data and Storage",
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
            "Data and Storage",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: ListView(
          children: <Widget>[
            SettingGroupTitle(
              "Automatic Media download",
              top: 15,
              left: 15,
            ),
            ListTile(
              title: Text("When using mobile data"),
              subtitle: Text(
                dataMediaDownload,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => getBottomSheet());
              },
            ),
            ListTile(
              title: Text("When connected to Wi-Fi"),
              subtitle: Text(
                wifiMediaDownload,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => getBottomSheet());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheet() {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          title: Text("Photos"),
          value: false,
          onChanged: (bool newValue) {},
        ),
        CheckboxListTile(
          title: Text("Video Messages"),
          value: false,
          onChanged: (bool newValue) {},
        ),
        CheckboxListTile(
          title: Text("Videos"),
          value: false,
          onChanged: (bool newValue) {},
        ),
        CheckboxListTile(
          title: Text("Files"),
          value: false,
          onChanged: (bool newValue) {},
        ),
        CheckboxListTile(
          title: Text("Music"),
          value: false,
          onChanged: (bool newValue) {},
        ),
        CheckboxListTile(
          title: Text("GIFs"),
          value: false,
          onChanged: (bool newValue) {},
        ),
        FlatButton(
            onPressed: () {},
            child: Text(
              "SAVE",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
