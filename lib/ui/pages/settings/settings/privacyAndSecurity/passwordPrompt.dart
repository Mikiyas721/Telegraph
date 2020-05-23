import 'dart:async';

import 'package:Telegraph/blocs/passwordbloc.dart';
import 'package:flutter/material.dart';
import '../../../../../blocs/passwordProvider.dart';

class PasswordPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
        blocFactory: () => PasswordBloc(),
        builder: (context, bloc) {
          return MaterialApp(
            title: "Enter Password",
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
                title: Text("Password"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      bool saved = bloc.save();
                      if (saved) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Password Saved')));
                        Timer(Duration(seconds: 1), () {
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
