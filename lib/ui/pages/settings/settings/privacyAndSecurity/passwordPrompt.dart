import 'dart:async';

import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/securityBloc.dart';
import 'package:flutter/material.dart';

class PasswordPrompt extends StatelessWidget {
  final snackBarKey = GlobalKey<ScaffoldState>();
  final ThemeData themeData;

  PasswordPrompt({this.themeData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecurityBloc>(
        blocFactory: () => SecurityBloc(),
        builder: (BuildContext context, SecurityBloc bloc) {
          return MaterialApp(
            title: "Enter Password",
            home: Scaffold(
              backgroundColor: themeData.scaffoldBackgroundColor,
              key: snackBarKey,
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
                  "Password",
                  style: themeData.textTheme.title,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: themeData.iconTheme.color,
                    ),
                    onPressed: () {
                      bool saved = bloc.savePassword();
                      if (saved) {
                        snackBarKey.currentState.showSnackBar(SnackBar(
                            backgroundColor: themeData.backgroundColor,
                            content: Text(
                              'Password Saved',
                              style: themeData.textTheme.body2,
                            )));
                        Timer(Duration(milliseconds: 400), () {
                          Navigator.pop(context);
                        });
                      }
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Enter a password",
                      style: TextStyle(
                          fontSize: 23,
                          color: themeData.textTheme.title.color,
                          fontWeight: FontWeight.bold),
                    ),
                    StreamBuilder(
                      stream: bloc.passwordErrorStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return TextField(
                          cursorColor: themeData.cursorColor,
                          onChanged: bloc.addPassword,
                          style: TextStyle(color:themeData.textTheme.body2.color, fontSize: 24),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: themeData.errorColor),
                            errorText: snapshot.data,
                            contentPadding: EdgeInsets.only(top: 20, bottom: 3),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
