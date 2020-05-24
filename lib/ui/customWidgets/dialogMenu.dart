import 'dart:async';
import 'package:Telegraph/controll/blocs/customWidgetBloc.dart';
import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:flutter/material.dart';

class DialogMenu extends StatelessWidget {
  final String title;
  final List<String> menus;
  final String selectedValue;
  final Function(String) parentSink;

  DialogMenu(
      {@required this.title,
      @required this.menus,
      @required this.selectedValue,
      this.parentSink});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomWidgetBloc>(
        blocFactory: () => CustomWidgetBloc(),
        builder: (BuildContext context, CustomWidgetBloc bloc) {
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
                  children: getContentChildren(bloc),
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
        });
  }

  List<Widget> getContentChildren(CustomWidgetBloc bloc) {
    List<Widget> menuWidgets = List<Widget>();
    for (String menu in menus) {
      menuWidgets.add(StreamBuilder(
          stream: bloc.dialogMenu,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return RadioListTile<String>(
                dense: true,
                title: Text(
                  menu,
                  style: TextStyle(fontSize: 16),
                ),
                value: menu,
                groupValue:
                    snapshot.data == null ? "$selectedValue" : snapshot.data,
                onChanged: (String newValue) {
                  bloc.setDialogMenuString(newValue);
                  parentSink(newValue);
                  Timer(Duration(milliseconds: 300), () {
                    Navigator.pop(context);
                  });
                });
          }));
    }
    return menuWidgets;
  }
}
