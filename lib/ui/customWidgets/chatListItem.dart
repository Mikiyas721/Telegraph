import '../../models/chat.dart';
import 'package:flutter/material.dart';
import '../../ui/customWidgets/myImageView.dart';

class ChatListItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final DateTime lastChatDateTime;
  final String lastChatString;
  final Function onTap;
  final Function onLongPress;
  final ChatType chatType;
  final String messageStatus = "Sent";

  ChatListItem({
    @required this.imageURL,
    @required this.title,
    @required this.lastChatDateTime,
    @required this.lastChatString,
    @required this.chatType,
    this.onTap,
    this.onLongPress,
  });

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
      leading: MyImageView(imageURL: imageURL),
      title:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Icon(
          getIcon(),
          color: Theme.of(context).iconTheme.color,
        ),
        Padding(
          child: Text(
            "$title",
            style: Theme.of(context).textTheme.body2,
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
            '${lastChatDateTime.hour} :${lastChatDateTime.minute} PM',
            //TODO needs correction
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
      subtitle: Text(
        "$lastChatString",
        style: Theme.of(context).textTheme.caption,
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
