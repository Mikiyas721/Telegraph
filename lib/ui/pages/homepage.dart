import 'package:Telegraph/controll/contact.dart';
import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../customWidgets/MyDrawer.dart';
import 'contactsPage.dart';
import 'package:contacts_service/contacts_service.dart';

class HomePage extends StatelessWidget {
  final String title = 'Telegraph';
  final ThemeData themeData;

  HomePage({this.themeData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        drawer: MyDrawer(
          themeData: themeData,
        ),
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          title: Text("$title", style: themeData.textTheme.title),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(
                  Icons.search,
                  color: themeData.iconTheme.color,
                ))
          ],
        ),
        body: ListView(
            children: ListTile.divideTiles(
                    context: context,
                    tiles: getPlaceHolderContacts(context, Theme.of(context)))
                .toList()),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          onPressed: () async {
            Iterable<Contact> contacts = await getContacts();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactsPage(contacts)));
          },
          child: Icon(
            Icons.create,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
