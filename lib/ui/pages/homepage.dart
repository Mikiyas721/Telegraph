import 'package:Telegraph/blocs/chatBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/passwordBloc.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/models/password.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:Telegraph/ui/customWidgets/chatListItem.dart';
import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../customWidgets/myDrawer.dart';

class HomePage extends StatelessWidget {
  final String title = 'Telegraph';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      blocFactory: () => ChatBloc(),
      builder: (BuildContext context, ChatBloc bloc) {
        bloc.fetchChats("12345");

        /// Add Id Here
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: MyDrawer(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("$title", style: Theme.of(context).textTheme.title),
            actions: <Widget>[
              BlocProvider<PasswordBloc>(
                blocFactory: () => PasswordBloc(),
                builder: (BuildContext context, PasswordBloc bloc) {
                  return StreamBuilder(
                      stream: bloc.passwordRepo.passwordStream,
                      builder: (BuildContext context, AsyncSnapshot snapShot) {
                        if (bloc.passwordRepo.getPreference<int>(
                                PreferenceKeys.userPassword) !=
                            null) {
                          bool isLocked = bloc.passwordRepo
                              .getPreference<bool>(PreferenceKeys.isLocked);
                          return IconButton(
                            icon: Icon(isLocked ? Icons.lock : Icons.lock_open),
                            onPressed: () {
                              bloc.passwordRepo.updateStream(PasswordModel(
                                  password:
                                      bloc.passwordRepo.dataStream.value == null
                                          ? null
                                          : bloc.passwordRepo.dataStream.value
                                              .password,
                                  isLocked: !isLocked));
                              bloc.passwordRepo.setPreference(
                                  PreferenceKeys.isLocked, !isLocked);
                            },
                            color: Theme.of(context).iconTheme.color,
                          );
                        }
                        return null;
                      });
                },
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ))
            ],
          ),
          body: StreamBuilder(
            stream: bloc.chatRepo.chatStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<ChatModel>> snapShot) {
              if (!snapShot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapShot.data.isEmpty)
                  return Center(
                    child: Text("You have no chats"),
                  );
                return ListView.separated(
                  itemCount: snapShot.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Theme.of(context).dividerColor,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ChatListItem(
                      imageURL: snapShot.data[index].chatImageUrl,
                      title: snapShot.data[index].chatTitle,
                      lastChatDateTime: snapShot.data[index].lastMessageTime,
                      lastChatString: snapShot.data[index].lastChatString,
                      chatType: snapShot.data[index].chatType,
                    );
                  },
                );
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:
                Theme.of(context).floatingActionButtonTheme.backgroundColor,
            onPressed: () async {
              await Assistant.getPermissions();
              Navigator.pushNamed(context, '/allContactsPage');
            },
            child: Icon(
              Icons.create,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        );
      },
    );
  }
}
