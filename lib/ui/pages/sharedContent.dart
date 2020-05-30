import 'package:flutter/material.dart';

class SharedContentPage extends StatelessWidget {
  final List<String> options = [
    'Shared Media',
    'Shared File',
    'Shared Music',
    'Shared Link'
  ];

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
                Navigator.pop(context);
              }),
          title: DropdownButton(
              selectedItemBuilder: (BuildContext context) => options
                  .map((String newValue) => Text(
                        "Shared Media",
                        style: TextStyle(color: Colors.white),
                      ))
                  .toList(),
              iconEnabledColor: Colors.white,
              elevation: 0,
              value: 'Shared Media',
              isDense: true,
              items: options
                  .map<DropdownMenuItem<String>>(
                      (String newValue) => DropdownMenuItem<String>(
                          value: newValue,
                          child: Text(
                            newValue,
                          )))
                  .toList(),
              onChanged: (String selectedValue) {}),
        ),
      );
  }
}
