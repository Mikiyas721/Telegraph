import 'package:flutter/material.dart';


class MessageDisplay extends StatefulWidget {
  final MessageDisplayState messageDisplayState;

  MessageDisplay(String message, String time)
      : messageDisplayState = MessageDisplayState(message, time);

  @override
  State<StatefulWidget> createState() {
    return messageDisplayState;
  }
}

class MessageDisplayState extends State<MessageDisplay> {
  final String message;
  final String time;

  MessageDisplayState(String message, String time)
      : message = message,
        time = time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => getMessageDialog(context));
      },
      child: Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        constraints: BoxConstraints(minWidth: 50, maxWidth: 400),
        child: Row(
          children: <Widget>[
            Text(message),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              time,
              style: TextStyle(color: Colors.grey),
            ),
            Padding(padding: EdgeInsets.only(left: 5)),
            Icon(Icons.check)
          ],
        ),
      ),
    );
  }

  Widget getMessageDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Message",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.subdirectory_arrow_left),
                title: Text("Reply"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.content_copy),
                title: Text("Copy"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text("Forward"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text("Forward without quoting"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text("Delete"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.cloud_upload),
                title: Text("Save to my cloud"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
