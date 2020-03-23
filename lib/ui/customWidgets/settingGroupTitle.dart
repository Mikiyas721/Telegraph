import 'package:flutter/material.dart';

class SettingGroupTitle extends StatelessWidget {
  final String title;
  final double top;
  final double bottom;
  final double left;
  final double right;

  SettingGroupTitle(this.title,
      {this.top = 0, this.right = 0, this.bottom = 0, this.left = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
      child: Text(
        title,
        style: TextStyle(color: Colors.blue),
        textAlign: TextAlign.left,
      ),
    );
  }
}
