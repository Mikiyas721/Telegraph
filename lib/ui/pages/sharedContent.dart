import 'package:flutter/material.dart';

class SharedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Content",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          /*title: Container(
              child: DropdownButton(
                  hint: Text("Content"),
                  items: getDropDownItems(),
                  onChanged: (dynamic selectedValue) {}),
              height: 50,
            )*/
        ),
        body: DropdownButton<Widget>(
            hint: Text("Content"),
            items: getDropDownItems(),
            onChanged: (dynamic selectedValue) {}),
      ),
    );
  }

  List<DropdownMenuItem<Widget>> getDropDownItems() {
    return [
      DropdownMenuItem(
        child: ListTile(
          leading: Icon(Icons.perm_media),
          title: Text("Shared Media"),
          trailing: Text(
            "0",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {},
        ),
      ),
      DropdownMenuItem(
        child: ListTile(
          leading: Icon(Icons.folder),
          title: Text("Shared File"),
          trailing: Text(
            "0",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {},
        ),
      ),
      DropdownMenuItem(
        child: ListTile(
          leading: Icon(Icons.music_note),
          title: Text("Shared Music"),
          trailing: Text(
            "0",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {},
        ),
      ),
      DropdownMenuItem(
        child: ListTile(
          leading: Icon(Icons.link),
          title: Text("Shared Link"),
          trailing: Text(
            "0",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {},
        ),
      ),
    ];
  }
}
