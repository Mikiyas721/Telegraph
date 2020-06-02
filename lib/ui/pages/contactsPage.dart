import 'package:Telegraph/blocs/contactBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/others/chatType.dart';
import 'package:Telegraph/ui/customWidgets/contactsList.dart';
import 'package:Telegraph/ui/pages/news/newAccount.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/news/channelDescription.dart';
import '../customWidgets/chatListItem.dart';
import 'chattingPage.dart';
import 'news/newGroup.dart';

class ContactsPage extends StatelessWidget {
  final String title = 'New Message';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
        blocFactory: () => ContactBloc(),
        builder: (BuildContext context, ContactBloc bloc) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  )),
              title: Text(
                "$title",
                style: Theme.of(context).textTheme.title,
              ),
              actions: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NewAccountPage()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
            body: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text('New Group',
                      style: Theme.of(context).textTheme.body2),
                  onTap: () {
                    Navigator.pushNamed(context, '/newGroupPage');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text('New Secret Chat',
                      style: Theme.of(context).textTheme.body2),
                  onTap: () {
                    Navigator.pushNamed(context, '/newGroupPage');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.volume_up,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text('New Channel',
                      style: Theme.of(context).textTheme.body2),
                  onTap: () {
                    Navigator.pushNamed(context, '/newChannelPage');
                  },
                ),
                StreamBuilder(
                    stream: bloc.contactRepo.contactStream,
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                      if (snapShot.data == null) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).iconTheme.color,
                        ));
                      } else {
                        return Column(
                          children: <Widget>[
                            Card(
                              margin: EdgeInsets.all(0),
                              child: Padding(
                                child: Text(
                                  "Contacts",
                                ),
                                padding: EdgeInsets.only(
                                    left: 10, top: 7, bottom: 7),
                              ),
                              color: Color.fromRGBO(250, 0, 0, 230),
                            ),
                          ],
                        );
                      }
                    })
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewAccountPage()));
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

List<Widget> getPlaceHolderContacts(BuildContext context, ThemeData themeData) {
  List<Widget> widgets = List<Widget>();
  for (int i = 0; i < 20; i++) {
    widgets.add(ChatListItem(
        "assets/avatar_1.png", "Rotractors", 1, 19, "PM", "Hi,How are you", () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChattingPage(
                  "Kebede", "assets/avatar_1.png", ChatType.SINGLE)));
    }, () {}, themeData: themeData));
  }
  return widgets;
}
