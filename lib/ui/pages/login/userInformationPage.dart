import 'package:Telegraph/blocs/userBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/user.dart';
import 'package:Telegraph/others/assistant.dart';
import 'package:Telegraph/ui/customWidgets/myImageView.dart';
import 'package:flutter/material.dart';

class UserInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      blocFactory: () => UserBloc(),
      builder: (BuildContext context, UserBloc bloc) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              title: Text(
                "Information",
                style: Theme.of(context).textTheme.title,
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Please provide your name and profile picture. First Name is Mandatory",
                style: Theme.of(context).textTheme.caption,
              ),
              MyImageView(
                imageURL: 'assets/avatar_1.png',
                onTap: () {},
              ),
              StreamBuilder(
                stream: bloc.userRepo.dataStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return TextField(
                    onChanged: (String newValue) {},
                    decoration: InputDecoration(
                        hintText: 'First Name(Required)',
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).textTheme.caption.color)),
                  );
                },
              ),
              StreamBuilder(
                stream: bloc.userRepo.dataStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return TextField(
                    onChanged: (String newValue) {},
                    decoration: InputDecoration(
                        hintText: 'Last Name(Optional)',
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).textTheme.caption.color)),
                  );
                },
              ),
              RaisedButton(
                onPressed: () async {
                  bool isAdded = await bloc.addNewUser(UserModel(
                      firstName: bloc.userRepo.dataStream.value.getFirstName,
                      lastName: bloc.userRepo.dataStream.value.getLastName,
                      phone: bloc.userRepo.dataStream.value.getPhoneNumber,
                      id: bloc.userRepo.dataStream.value.getId,
                      countryCode:
                          bloc.userRepo.dataStream.value.getCountryCode,
                      lastSeen: bloc.userRepo.dataStream.value.getLastSeen));
                  if (isAdded) {
                    Navigator.pushReplacementNamed(context, '/homePage');
                    Assistant.setUpDefaults();
                    bloc.setIsLoggedIn();
                  }
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
