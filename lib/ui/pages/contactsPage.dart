import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {

          }),
    );
  }
}
