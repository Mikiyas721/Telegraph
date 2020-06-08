import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final DateTime callTime;
  final CallType callType;

  CallItem({this.imageUrl, this.title, this.callTime, this.callType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MyImageView(imageURL: imageUrl),
      title: Text(
        '$title',
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(
            callType == CallType.INCOMING
                ? Icons.call_received
                : Icons.call_made,
            color: callType == CallType.INCOMING ? Colors.red : Colors.green,
          ),
          Text(
            '${callTime.toString()}',
            style: TextStyle(color:Theme.of(context).textTheme.title.color, fontSize: 13),
          ),
        ],
      ),
      trailing: IconButton(
        color: Theme.of(context).iconTheme.color,
        icon: Icon(
          Icons.call,
        ),
        onPressed: () {},
      ),
    );
  }
}

enum CallType { OUTGOING, INCOMING }
