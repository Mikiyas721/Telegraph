import 'package:Telegraph/blocs/contactBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/ui/customWidgets/contactItem.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
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
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Contacts",
                style: Theme.of(context).textTheme.title,
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/newContactPage');
                    })
              ],
            ),
            body: StreamBuilder(
                stream: bloc.contactRepo.phoneContactStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<ContactModel>> snapShot) {
                  if (!snapShot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapShot.data.isEmpty) {
                      return Center(
                          child: Text(
                        "None of your contacts have Telegraph",
                        style: Theme.of(context).textTheme.body2,
                      ));
                    }
                    return ListView.separated(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ContactItem(
                            imageUrl: 'assets/avatar_1.png',
                            userName: snapShot.data[index].firstName,
                            lastSeen: snapShot.data[index].lastSeen);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(color: Theme.of(context).dividerColor);
                      },
                    );
                  }
                }));
      },
    );
  }
}
