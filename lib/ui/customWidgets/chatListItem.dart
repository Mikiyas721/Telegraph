import 'package:flutter/material.dart';
import 'package:telegraph/models/chatType.dart';

class ChatListItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final int hour;
  final int minute;
  final String meridian;
  final String lastChatString;
  final Function onTap;
  final Function onLongPress;
  final ChatType chatType = ChatType.SINGLE;

  ChatListItem(this.imageURL, this.title, this.hour, this.minute, this.meridian,
      this.lastChatString, this.onTap, this.onLongPress /*,{chatType: type}*/);

  /*chatType = type;*/

  IconData getIcon() {
    if (chatType == ChatType.BOT)
      return Icons.border_top;
    else if (chatType == ChatType.CHANNEL)
      return Icons.people;
    else if (chatType == ChatType.GROUP)
      return Icons.people;
    else
      return Icons.person;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          dense: true,
          leading: Container(
            child: Image.asset(imageURL),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(getIcon()),
              Padding(
                child: Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                padding: EdgeInsets.only(left: 7, bottom: 5),
              ),
              Spacer(),
              Text(
                '$hour :$minute $meridian',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          subtitle: Text(
            "$lastChatString",
            style: TextStyle(fontSize: 13),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        ),
        Divider(
          thickness: 2,
          indent: 70,
        )
      ],
    );
  }
//TODO Widget to give the divider a position at the bottom
}
