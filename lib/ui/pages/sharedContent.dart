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
          //TODO find a way to make the color of the DropdownButton different
          title: DropdownButton(
              style: TextStyle(color: Colors.black),
              iconEnabledColor: Colors.white,
              elevation: 0,
              value: 'Shared Media',
              isDense: true,
              /*hint: Text("Content"),*/
              items: [
                'Shared Media',
                'Shared File',
                'Shared Music',
                'Shared Link'
              ]
                  .map<DropdownMenuItem<String>>(
                      (String newValue) => DropdownMenuItem<String>(
                          value: newValue,
                          child: Text(
                            newValue,
                          )))
                  .toList(),
              onChanged: (String selectedValue) {}),
        ),
      ),
    );
  }
}
