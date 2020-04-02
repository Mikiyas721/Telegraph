import 'package:flutter/material.dart';
import 'package:telegraph/ui/pages/login/firstPage.dart';
import 'ui/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool loggedIn = true;
  Widget startingPage;

  MyApp() {
    if (loggedIn)
      startingPage = HomePage();
    else
      startingPage = FirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startingPage,
    );
  }
}
//TODO replace App bar FlatButtons with IconButton
