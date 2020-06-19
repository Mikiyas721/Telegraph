import '../../blocs/chatBloc.dart';
import '../../blocs/contactBloc.dart';
import '../../blocs/provider/provider.dart';
import '../../core/mixins/date_formatter.dart';
import '../../models/message.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import '../../ui/pages/profilePage.dart';

class ChattingPage extends StatelessWidget with FormatterMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      blocFactory: () => ContactBloc(),
      builder: (BuildContext context, ContactBloc bloc) {
        String name = bloc.contactRepo.dataStream.value.name;
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: GestureDetector(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar_1.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '$name',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            '${formatLog(getDateTime(bloc.contactRepo.dataStream.value.lastSeen))}',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProfilePage()));
                },
              ),
              actions: <Widget>[
                PopupMenuButton(
                  onSelected: (selectedValue) {},
                  itemBuilder: (context) {
                    return null;
                  },
                )
              ],
            ),
            body: BlocProvider<ChatBloc>(
                blocFactory: () => ChatBloc(),
                builder: (BuildContext context, ChatBloc bloc) {
                  bloc.fetchChatMessages(bloc.chatRepo.dataStream.value.id);
                  return StreamBuilder(
                    stream: bloc.messagesStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ChatMessage>> snapshot) {
                      return DashChat(
                          showAvatarForEveryMessage: false,
                          onLongPressMessage: (ChatMessage chatMessage) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    getMessageDialog(context));
                          },
                          messages: snapshot.data == null ? [] : snapshot.data,
                          user: ChatUser(name: '$name'),
                          onSend: (ChatMessage chatMessage) {});
                    },
                  );
                }));
      },
    );
  }

  Widget getMessageDialog(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 10, bottom: 10),
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
                dense: true,
                leading: Icon(Icons.subdirectory_arrow_left),
                title: Text(
                  "Reply",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.content_copy),
                title: Text(
                  "Copy",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text(
                  "Forward",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.subdirectory_arrow_right),
                title: Text(
                  "Forward without quoting",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.edit),
                title: Text(
                  "Edit",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.delete),
                title: Text(
                  "Delete",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                dense: true,
                leading: Icon(Icons.cloud_upload),
                title: Text(
                  "Save to my cloud",
                  style: TextStyle(fontSize: 16),
                ),
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
