import 'package:flutter/material.dart';
import 'package:Telegraph/others/chatType.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';

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
  final String messageStatus = "Sent";

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

  IconData getMessageStatusIcon() {
    if (messageStatus == "Pending")
      return Icons.access_time;
    else if (messageStatus == "Sent")
      return Icons.check;
    else if (messageStatus == "Seen")
      return Icons.check_circle;
    else
      return null;
  }

  Color getMessageStatusColor() {
    if (messageStatus == "Pending")
      return Colors.grey;
    else
      return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: MyImageView(imageURL),
      title:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Icon(getIcon()),
        Padding(
          child: Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          padding: EdgeInsets.only(left: 7, bottom: 5),
        ),
      ]),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            getMessageStatusIcon(),
            color: getMessageStatusColor(),
            size: 15,
          ),
          Padding(padding: EdgeInsets.only(left: 5)),
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
    );
  }

/*@override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
        separatorBuilder: (context, index) => Divider(),
        itemCount: 1);
  }*/
}
