import 'package:flutter/material.dart';

class SettingGroupTitle extends StatelessWidget {
  final String title;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final bool bold;

  SettingGroupTitle(this.title, this.bold,
      {this.top = 0, this.right = 0, this.bottom = 0, this.left = 0});

  @override
  Widget build(BuildContext context) {
    Text text;
    if (bold) {
      text = Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.title.color,backgroundColor: Theme.of(context).scaffoldBackgroundColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      );
    } else {
      text = Text(
        title,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.left,
      );
    }

    return Padding(
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: text);
  }
}
