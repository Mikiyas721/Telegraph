import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
      ),
    );
  }
}
