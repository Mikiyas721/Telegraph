import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatWindow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatWindowState();
  }
}

class ChatWindowState extends State<ChatWindow> {
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
          title: Row(
            children: <Widget>[Image.asset(''), Text('RAC Solyana Min...')],
          ),
          actions: <Widget>[
            PopupMenuButton(itemBuilder: (context){
              List<PopupMenuEntry> x = [new PopupMenuItem(child: Text('Search')),new PopupMenuItem(child: Text('Mute Notification'),)];
              return x;
                },)
          ],
        ),
        body: Image.asset(''),
        bottomSheet: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.sentiment_very_satisfied),
              onTap: () {},
            ),
            /*TextField(
              onChanged: (newValue){},
              onTap: () {},
              decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),*/
            GestureDetector(
              child: Icon(Icons.attach_file),
              onTap: () {},
            ),
            GestureDetector(
              child: Icon(Icons.keyboard_voice),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
