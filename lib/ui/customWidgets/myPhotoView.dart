import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MyPhotoView extends StatelessWidget {
  final String _imageURL;
  final ThemeData themeData;

  MyPhotoView(this._imageURL, {this.themeData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photo View",
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: themeData.primaryColor,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: themeData.iconTheme.color,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              "1 of 1",
              style: themeData.textTheme.title,
            ),
            actions: <Widget>[
              PopupMenuButton(
                color: themeData.backgroundColor,
                onSelected: (selectedValue) {
                  if (selectedValue == 1) {}
                },
                itemBuilder: (context) {
                  return getMenu();
                },
              )
            ],
          ),
          body: Container(
            margin: EdgeInsets.only(top: 5),
            color: Colors.black,
            child: PhotoView(imageProvider: AssetImage(_imageURL)),
            height: (MediaQuery.of(context).size.height) * 0.72,
          ),
          floatingActionButton: Opacity(
            opacity: 1,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {},
              child: Opacity(
                opacity: 1,
                child: Icon(Icons.share),
              ),
            ),
          )),
    );
  }

  List<PopupMenuEntry> getMenu() {
    List<String> menuListString = [
      'Save to gallery',
    ];
    List<PopupMenuEntry> menuList = [];
    int i = 0;
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(
          value: i,
          child: Text(
            menu,
            style: themeData.textTheme.caption,
          )));
      i++;
    }
    return menuList;
  }
}
