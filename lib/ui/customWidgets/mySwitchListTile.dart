import 'package:flutter/material.dart';

/*class MySwitchListTile extends StatefulWidget {
  final MySwitchListTileState mySwitchListTileState;

  MySwitchListTile(String title, {String subTitle, bool value = false})
      : mySwitchListTileState = MySwitchListTileState(title, subTitle, value);

  @override
  State<StatefulWidget> createState() {
    return mySwitchListTileState;
  }

  bool get value => mySwitchListTileState.value;
}*/

class MySwitchListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool value;
  final Function(bool newValue) onChanged;

  MySwitchListTile(
      {@required this.title,
      /*@required*/ this.value,
      /*@required*/ this.onChanged,
      this.subTitle});

  bool get getValue => value;

  @override
  Widget build(BuildContext context) {
    if (subTitle == null) {
      return SwitchListTile(
        onChanged: onChanged,
        value: value,
        title: Text(title),
      );
    } else {
      return SwitchListTile(
        onChanged: onChanged,
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
