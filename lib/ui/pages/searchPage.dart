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
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
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
            FlatButton(
                onPressed: () {},
                child: Icon(
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
