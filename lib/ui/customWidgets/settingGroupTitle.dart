import 'package:flutter/material.dart';

class SettingGroupTitle extends StatelessWidget {
  final String title;
  final double top;
  final double bottom;
  final double left;
  final double right;

  SettingGroupTitle(this.title, {this.top, this.right, this.bottom, this.left});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
