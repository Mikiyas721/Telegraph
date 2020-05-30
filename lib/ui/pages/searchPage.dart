import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.white,
              )),
          title: TextField(
            onChanged: (newValue) {},
            cursorColor: Colors.white,
            decoration: InputDecoration.collapsed(
                hintText: 'Search', hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 18,)),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView(),
      );
  }
}
