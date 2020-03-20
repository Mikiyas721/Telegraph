import 'package:flutter/material.dart';

class InfoDisplay extends StatelessWidget {
  InfoDisplay(this.title, this.subTitle, {this.onTap});

  final String title;
  final String subTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}
