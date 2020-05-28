import 'package:flutter/material.dart';

class InfoDisplay extends StatelessWidget {
  InfoDisplay(this.title, this.subTitle, {this.onTap, this.themeData});

  final String title;
  final String subTitle;
  final Function onTap;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      title: Text(
        title,
        style: themeData.textTheme.body2,
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}
