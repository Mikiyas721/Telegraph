import 'package:flutter/material.dart';

class MySwitchListTile extends StatefulWidget {
  final MySwitchListTileState mySwitchListTileState;

  MySwitchListTile(String title, {String subTitle, bool value = false})
      : mySwitchListTileState = MySwitchListTileState(title, subTitle, value);

  @override
  State<StatefulWidget> createState() {
    return mySwitchListTileState;
  }

  get value => mySwitchListTileState.value;
}

class MySwitchListTileState extends State<MySwitchListTile> {
  String title;
  String subTitle;
  bool value;

  MySwitchListTileState(String title, String subTitle, bool value)
      : title = title,
        subTitle = subTitle,
        value = value;

  @override
  Widget build(BuildContext context) {
    if (subTitle == null) {
      return SwitchListTile(
        onChanged: (bool newValue) {
          setState(() {
            value = !value;
          });
        },
        value: value,
        title: Text(title),
      );
    } else {
      return SwitchListTile(
        onChanged: (bool newValue) {
          setState(() {
            value = !value;
          });
        },
        value: value,
        title: Text(title),
        subtitle: Text(
          subTitle,
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
  }
}
