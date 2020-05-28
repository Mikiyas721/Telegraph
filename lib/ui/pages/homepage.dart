import 'package:Telegraph/controll/contact.dart';
import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../customWidgets/MyDrawer.dart';
import 'contactsPage.dart';
import 'package:contacts_service/contacts_service.dart';

class HomePage extends StatelessWidget {
  final String title = 'Telegraph';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: MyDrawer(themeData: Theme.of(context),),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("$title"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView(
            children: ListTile.divideTiles(
                    context: context, tiles: getPlaceHolderContacts(context))
                .toList()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
          onPressed: () async {
            Iterable<Contact> contacts = await getContacts();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactsPage(contacts)));
          },
          child: Icon(
            Icons.create,
          ),
        ),
      ),
    );
  }
}
