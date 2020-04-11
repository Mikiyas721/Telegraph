import 'package:Telegraph/ui/customWidgets/myPhotoView.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:Telegraph/ui/customWidgets/settingGroupTitle.dart';
import 'package:Telegraph/ui/pages/sharedContent.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                PopupMenuButton(
                    itemBuilder: (BuildContext context) => getMenu())
              ],
              expandedHeight: 150,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          child: GestureDetector(
                            child: MyImageView("assets/avatar_1.png"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyPhotoView("assets/avatar_1.png")));
                            },
                          ),
                          padding: EdgeInsets.only(right: 5)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Kebede",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            "last seen at 12:27 AM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      )
                    ],
                  ) /*ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Image.asset(
                    "assets/avatar_1.png",width: 20,
                  ),
                  title: Text(
                    "Kebede",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  subtitle: Text(
                    "last seen at 12:27 AM",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),*/
                  ),
            )
          ],
          body: ListView(children: <Widget>[
            SettingGroupTitle("Info", true, left: 18),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => getDialogs(true));
              },
              leading: Icon(Icons.phone),
              title: Text("+251 941135730"),
              subtitle: Text(
                "Mobile",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => getDialogs(false));
              },
              leading: Icon(Icons.supervised_user_circle),
              title: Text("@MIKI_YAS"),
              subtitle: Text(
                "Username",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 20,
            ),
            SwitchListTile(
              title: Text("Notification"),
              value: true,
              onChanged: (bool value) {},
            ),
            SettingGroupTitle(
              "Shared Content",
              true,
              left: 18,
              top: 5,
              bottom: 5,
            ),
            ListTile(
              leading: Icon(Icons.perm_media),
              title: Text("Shared Media"),
              trailing: Text(
                "0",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SharedContent()));
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text("Shared File"),
              trailing: Text(
                "0",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SharedContent()));
              },
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text("Shared Music"),
              trailing: Text(
                "0",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SharedContent()));
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text("Shared Link"),
              trailing: Text(
                "0",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SharedContent()));
              },
            ),
          ]),
        ),
      ),
    );
  }

  List<PopupMenuEntry> getMenu() {
    List<String> menuListString = [
      'Share',
      'Block',
      'Edit',
      'Delete',
      'Add Shortcut',
    ];
    List<PopupMenuEntry> menuList = [
      new PopupMenuItem(
          value: 1,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.share),
            title: Text(
              "Share Contact",
              style: TextStyle(fontSize: 16),
            ),
          )),
      new PopupMenuItem(
          value: 2,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.block),
            title: Text(
              "Block user",
              style: TextStyle(fontSize: 16),
            ),
          )),
      new PopupMenuItem(
          value: 3,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.edit),
            title: Text(
              "Edit Contact",
              style: TextStyle(fontSize: 16),
            ),
          )),
      new PopupMenuItem(
          value: 4,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.delete),
            title: Text(
              "Delete contact",
              style: TextStyle(fontSize: 17),
            ),
          )),
      new PopupMenuItem(
          value: 5,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.add_to_home_screen),
            title: Text(
              "Add to Home screen",
              style: TextStyle(fontSize: 17),
            ),
          )),
    ];
    return menuList;
  }

  Widget getDialogs(bool isPhoneNumber) {
    List<Widget> children;
    if (isPhoneNumber) {
      children = [
        ListTile(
          dense: true,
          title: Text(
            "Call",
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          title: Text(
            "Copy",
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {},
        ),
      ];
    } else {
      children = [
        ListTile(
          dense: true,
          title: Text(
            "Copy",
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {},
        ),
      ];
    }
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
