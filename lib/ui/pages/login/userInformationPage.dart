import 'package:Telegraph/blocs/userBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/user.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UserInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      blocFactory: () => UserBloc(),
      builder: (BuildContext context, UserBloc bloc) {
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              leading: null,
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                "Information",
                style: Theme.of(context).textTheme.title,
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.01 * width),
                child: Text(
                  "Please provide your name and profile picture. First Name is Mandatory",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              MyImageView(
                imageURL: 'assets/avatar_1.png',
                onTap: () {
                  Toast.show("Tap", context);
                },
              ),
              StreamBuilder(
                stream: bloc.userRepo.dataStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 0.25 * width, right: 0.25 * width),
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (String newValue) {
                        bloc.updateName(newValue, true, true);
                      },
                      decoration: InputDecoration(
                          hintText: 'First Name(Required)',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).textTheme.caption.color)),
                    ),
                  );
                },
              ),
              StreamBuilder(
                stream: bloc.userRepo.dataStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Padding(
                      padding: EdgeInsets.only(
                          left: 0.25 * width, right: 0.25 * width),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (String newValue) {
                          bloc.updateName(newValue, false, true);
                        },
                        decoration: InputDecoration(
                            hintText: 'Last Name(Optional)',
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color:
                                    Theme.of(context).textTheme.caption.color)),
                      ));
                },
              ),
              RaisedButton(
                onPressed: () async {
                  bloc.onSubmitClicked(context);
                },
                child: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.button,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
