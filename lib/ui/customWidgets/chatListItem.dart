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
    if(chatType == ChatType.BOT) return Icons.border_top;
    else if(chatType == ChatType.CHANNEL) return Icons.people;
    else if(chatType == ChatType.GROUP) return Icons.people;
    else return Icons.person;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imageURL),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(getIcon()),
          Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Spacer(),
          Text(
            '$hour :$minute $meridian',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$lastChatString"),
          Divider(
            thickness: 2,
          )
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
  //TODO Widget to give the divider a position at the bottom
}
