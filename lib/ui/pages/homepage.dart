import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../customWidgets/MyDrawer.dart';
import 'contactsPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String title = 'Telegraph';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Home Page",
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          /*leading: FlatButton(onPressed: () {}, child: Icon(Icons.dehaze)),*/
          title: Text("$title"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Icon(
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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactsPage()));
          },
          child: Icon(Icons.create),
        ),
      ),
    );
  }
}
