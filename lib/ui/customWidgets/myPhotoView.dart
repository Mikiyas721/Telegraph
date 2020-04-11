import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MyPhotoView extends StatelessWidget {
  final String _imageURL;

  MyPhotoView(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photo View",
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "1 of 1",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            PopupMenuButton(
              color: Colors.black,
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Icon(Icons.share),
        ),
      ),
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
            style: TextStyle(color: Colors.white),
          )));
      i++;
    }
    return menuList;
  }
}
