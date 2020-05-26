import 'dart:async';

import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/blocs/securityBloc.dart';
import 'package:flutter/material.dart';

class PasswordPrompt extends StatelessWidget {
  final snackBarKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecurityBloc>(
        blocFactory: () => SecurityBloc(),
        builder: (BuildContext context, SecurityBloc bloc) {
          return MaterialApp(
            title: "Enter Password",
            home: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              key: snackBarKey,
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
                title: Text("Password"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      bool saved = bloc.savePassword();
                      if (saved) {
                        snackBarKey.currentState.showSnackBar(
                            SnackBar(content: Text('Password Saved')));
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
                      style: TextStyle(fontSize: 18),
                    ),
                    StreamBuilder(
                      stream: bloc.passwordErrorStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return TextField(
                          onChanged: bloc.addPassword,
                          style: TextStyle(fontSize: 30),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
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
