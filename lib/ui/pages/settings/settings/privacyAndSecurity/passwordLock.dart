import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class PasswordLockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 10),
              child: Icon(
                Icons.lock,
                size: 70,
                color: Colors.grey,
              ),
            ),
            Text(
              "Enter your password",
              style: TextStyle(color: Colors.white),
            ),
            StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ));
              },
            ),
            VirtualKeyboard(
              textColor: Colors.white,
              fontSize: 28,
              type: VirtualKeyboardType.Numeric,
              onKeyPress: () {},
            )
          ],
        ),
      );
  }
}
