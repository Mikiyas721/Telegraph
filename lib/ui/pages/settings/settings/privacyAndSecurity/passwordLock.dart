import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/blocs/setting/passwordBloc.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class PasswordLockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordBloc>(
      blocFactory: () => PasswordBloc(),
      builder: (BuildContext context, PasswordBloc bloc) {
        int correctPassword =
            bloc.passwordRepo.getPreference<int>(PreferenceKeys.userPassword);
        print("Correct Password $correctPassword");
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
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    onChanged: (String enteredValue) {
                      if (int.parse(enteredValue) == correctPassword)
                        Navigator.pushReplacementNamed(context, '/homePage');
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  )),
              VirtualKeyboard(
                textColor: Colors.white,
                fontSize: 28,
                type: VirtualKeyboardType.Numeric,
                onKeyPress: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
