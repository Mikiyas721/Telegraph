import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
              textColor: Colors.white,
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: ListTile(
            leading: Image.asset(
              "assets/avatar_1.png",
            ),
            title: Align(
              child: Text(
                "Abebe",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            subtitle: Text(
              "last seen 11:41AM",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (selectedValue) {},
              itemBuilder: (context) {
                return getMenu();
              },
            )
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Sliver AppBar"),
              floating: true,
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.black54,
              ),

            )
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry> getMenu() {
    List<String> menuListString = [
      'Edit name',
      'Log out',
    ];
    List<PopupMenuEntry> menuList = [];
    for (String menu in menuListString) {
      menuList.add(new PopupMenuItem(child: Text(menu)));
    }
    return menuList;
  }
}
