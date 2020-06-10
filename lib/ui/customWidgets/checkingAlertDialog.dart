import 'package:flutter/material.dart';

class CheckingAlertDialog extends StatelessWidget {
  final void Function() onCancelClicked;
  final void Function() onOkClicked;
  final String message;

  CheckingAlertDialog(
      {this.message = "Are you sure you want to continue?",
      @required this.onCancelClicked,
      @required this.onOkClicked});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      title: Text("Information"),
      content: Text(
        message,
        style: Theme.of(context).textTheme.body1,
      ),
      actions: <Widget>[
        FlatButton(onPressed: onCancelClicked, child: Text("Cancel")),
        FlatButton(onPressed: onOkClicked, child: Text("Ok")),
      ],
    );
  }
}
