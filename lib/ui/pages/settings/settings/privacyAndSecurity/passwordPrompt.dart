import 'dart:async';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/passwordBloc.dart';
import 'package:Telegraph/models/password.dart';
import 'package:flutter/material.dart';

class PasswordEnteringPage extends StatelessWidget {
  final snackBarKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
        blocFactory: () => PasswordBloc(),
        builder: (BuildContext context, PasswordBloc bloc) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            key: snackBarKey,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text(
                "Password",
                style: Theme.of(context).textTheme.title,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    bool saved = bloc.savePassword();
                    if (saved) {
                      snackBarKey.currentState.showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).backgroundColor,
                          content: Text(
                            'Password Saved',
                            style: Theme.of(context).textTheme.body2,
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
                        color: Theme.of(context).textTheme.title.color,
                        fontWeight: FontWeight.bold),
                  ),
                  StreamBuilder(
                    stream: bloc.passwordErrorStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return TextField(
                        cursorColor: Theme.of(context).cursorColor,
                        onChanged: (String password){
                          bloc.passwordRepo.setPassword(PasswordModel(password: password));
                        },
                        style: TextStyle(
                            color: Theme.of(context).textTheme.body2.color,
                            fontSize: 24),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Theme.of(context).errorColor),
                          errorText: snapshot.data,
                          contentPadding: EdgeInsets.only(top: 20, bottom: 3),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
