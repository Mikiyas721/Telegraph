import 'dart:async';
import 'package:Telegraph/blocs/customWidgetBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:flutter/material.dart';

class DialogMenu extends StatelessWidget {
  final String title;
  final List<String> menus;
  final String selectedValue;
  final Function(String) parentSink;
  final ThemeData themeData;
  final String preferenceKey;

  DialogMenu(
      {@required this.title,
      @required this.menus,
      @required this.selectedValue,
      @required this.parentSink,this.preferenceKey,this.themeData});

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
            backgroundColor: themeData.dialogBackgroundColor,
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
                  style: themeData.textTheme.body1,
                ),
                value: menu,
                groupValue:
                    snapshot.data == null ? "$selectedValue" : snapshot.data,
                onChanged: (String newValue) {
                  bloc.setDialogMenuString(newValue);
                  parentSink(newValue);
                  PreferenceKeys.setPreference(preferenceKey,newValue);
                  Timer(Duration(milliseconds: 300), () {
                    Navigator.pop(context);
                  });
                });
          }));
    }
    return menuWidgets;
  }
}
