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
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      content: ListView(
        children: getContentChildren(),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }

  List<Widget> getContentChildren() {
    List<Widget> menuWidgets;
    for (String menu in menus) {
      menuWidgets.add(Radio(
          value: menu,
          groupValue: menu,
          onChanged: (String selectedValue) {
            setState(() {
              this.selectedValue = selectedValue;
            });
          }));
    }
    return menuWidgets;
  }
}
