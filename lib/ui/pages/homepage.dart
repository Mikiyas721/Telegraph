import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../customWidgets/myDrawer.dart';
import 'contactsPage.dart';

class HomePage extends StatelessWidget {
  final String title = 'Telegraph';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("$title", style: Theme.of(context).textTheme.title),
        actions: <Widget>[
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
      body: ListView(
          children: ListTile.divideTiles(
                  context: context,
                  tiles: getPlaceHolderContacts(context, Theme.of(context)))
              .toList()),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () {
          Navigator.pushNamed(context, '/contactsPage');
        },
        child: Icon(
          Icons.create,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
