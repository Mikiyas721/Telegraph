import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/passwordBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordLockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
      blocFactory: () => PasswordBloc(),
      builder: (BuildContext context, PasswordBloc bloc) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                style: Theme.of(context).textTheme.body2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: StreamBuilder(
                    stream: bloc.passwordCheck,
                    builder: (BuildContext context, AsyncSnapshot snapShot) {
                      return TextField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        showCursor: false,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        onChanged: (String enteredValue) {
                         bloc.onPasswordEntered(enteredValue, context);
                        },
                        onSubmitted: (String value) {
                          bloc.onPasswordEntered(value, context);
                        },
                        decoration: InputDecoration(
                            errorText: snapShot.data,
                            hintText: snapShot.data == null
                                ? ''
                                : snapShot.data == null,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
