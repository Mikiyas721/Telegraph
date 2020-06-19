import '../../../ui/customWidgets/myImageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(
                  context,'/homePage');
            }),
        title: Text(
          "New Channel",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Padding(
                padding: EdgeInsets.all(10),
                child: MyImageView(imageURL:
                  "assets/avatar_1.png",
                )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 100),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Channel name",
                    hintStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "You can provide an optional description"
              " for your channel.",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
