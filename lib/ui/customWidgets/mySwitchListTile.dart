import 'package:flutter/material.dart';

class MySwitchListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final Function(bool newValue) onChanged;
  final ThemeData themeData;

  MySwitchListTile(
      {@required this.title,
      @required this.value,
      @required this.onChanged,
      this.subTitle, this.themeData});

  bool get getValue => value;

  @override
  Widget build(BuildContext context) {
    if (subTitle == null) {
      return SwitchListTile(
        activeColor: themeData.accentColor,
        inactiveThumbColor: themeData.accentIconTheme.color,
        onChanged: onChanged,
        value: value,
        title: Text(title,style: themeData.textTheme.body2,),
      );
    } else {
      return SwitchListTile(
        activeColor: themeData.accentColor,
        inactiveThumbColor: themeData.accentIconTheme.color,
        onChanged: onChanged,
        value: value,
        title: Text(title,style: themeData.textTheme.body2,),
        subtitle: Text(
          subTitle,
          style: themeData.textTheme.caption,
        ),
      );
    }
  }
}
