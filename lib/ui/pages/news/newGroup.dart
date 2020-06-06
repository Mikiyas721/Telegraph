import 'package:Telegraph/others/assistant.dart';
import 'package:flutter/material.dart';

class NewGroupPage extends StatelessWidget {
  final String title;

  const NewGroupPage(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            }),
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 8),
                hintText: "Add people ...",
                hintStyle: Theme.of(context).textTheme.body1),
          ),
          Column(
            children: Assistant.getPlaceHolderContacts(),
          )
        ],
      ),
    );
  }
}
