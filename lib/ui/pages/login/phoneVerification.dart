import 'package:Telegraph/blocs/phoneBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:flutter/material.dart';

class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      blocFactory: () => UserBloc(),
      builder: (BuildContext context, UserBloc bloc) {
        bloc.sendSms(bloc.userRepo.dataStream.value.toString());
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              "Phone Verification",
              style: Theme.of(context).textTheme.title,
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/homePage');
                  })
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "We've sent a verification code to the phone Number you entered in the previous page",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                StreamBuilder(
                  stream: bloc.userRepo.getStream<String>(bloc.validateCode),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (String code) async {
                        if (code == bloc.verificationNumber) {
                          if (await bloc.isUserNew()) {
                            Navigator.pushReplacementNamed(
                                context, '/userInformationPage');
                          } else {
                            Navigator.pushReplacementNamed(
                                context, '/homePage');
                          }
                        }
                      },
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          errorText: snapshot.data,
                          hintText: "Code",
                          hintStyle: Theme.of(context).textTheme.body1),
                    );
                  },
                ),
                Text(""),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Didn't get the code",
                      style: TextStyle(color: Colors.blue),
                    )),
                Spacer(),
                FlatButton(
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/phoneNumberInputPage');
                    },
                    child: Text(
                      "Wrong number?",
                      style: Theme.of(context).textTheme.button,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
