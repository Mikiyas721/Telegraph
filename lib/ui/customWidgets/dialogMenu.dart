import 'package:flutter/material.dart';

class DialogMenu extends StatefulWidget {
  final DialogMenuState dialogMenuState;

  DialogMenu(String title, List<String> menus)
      : dialogMenuState = DialogMenuState(title, menus);

  @override
  State<StatefulWidget> createState() {
    return dialogMenuState;
  }
}

class DialogMenuState extends State<DialogMenu> {
  String title;
  List<String> menus;
  String selectedValue;

  DialogMenuState(this.title, this.menus);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 5),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: getContentChildren(),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }

  List<Widget> getContentChildren() {
    List<Widget> menuWidgets = List<Widget>();
    for (String menu in menus) {
      menuWidgets.add(RadioListTile(
          dense: true,
          title: Text(
            menu,
            style: TextStyle(fontSize: 16),
          ),
          value: "XYZ",
          onChanged: (String selectedValue) {
            setState(() {
              this.selectedValue = selectedValue;
            });
          }));
    }
    return menuWidgets;
  }
}
