import 'package:Telegraph/blocs/contactBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/ui/customWidgets/contactItem.dart';
import 'package:Telegraph/ui/pages/news/newAccount.dart';
import 'package:flutter/material.dart';

class AllContactsPage extends StatelessWidget {
  final String title = 'New Message';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
        blocFactory: () => ContactBloc(),
        builder: (BuildContext context, ContactBloc bloc) {
          bloc.fetchApiContacts();
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
                                  NewContactPage()));
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
                    stream: bloc.contactRepo.apiContactStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ContactModel>> snapShot) {
                      if (snapShot.data == null) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        if (snapShot.data.isEmpty) {
                          return Center(
                              child: Text(
                            "None of your contacts have Telegraph",
                            style: Theme.of(context).textTheme.body2,
                          ));
                        }
                        return ListView.separated(
                            itemCount: snapShot.data.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                  color: Theme.of(context).dividerColor);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ContactItem(
                                imageUrl: 'assets/avatar_1.png',
                                userName: snapShot.data[index].firstName,
                                lastSeen: snapShot.data[index].lastSeen,
                              );
                            });
                      }
                    })
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/newContactPage');
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
/*Card(
margin: EdgeInsets.all(0),
child: Padding(
child: Text(
"Contacts",
),
padding: EdgeInsets.only(
left: 10, top: 7, bottom: 7),
),
color: Theme.of(context).primaryColorLight,
)*/
