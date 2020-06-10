import 'package:Telegraph/blocs/userBloc.dart';
import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:Telegraph/models/user.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberInputPage extends StatelessWidget {
  PhoneNumberInputPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      blocFactory: () => UserBloc(),
      builder: (BuildContext context, UserBloc bloc) {
        bloc.userRepo.updateStream(UserModel(countryCode: '+251', phone: null));
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
              "Your phone",
              style: Theme.of(context).textTheme.title,
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    bloc.onNumberEntered(context);
                  })
            ],
          ),
          body: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Choose your country",
                  style: Theme.of(context).textTheme.body2,
                ),
                trailing: CountryCodePicker(
                  textStyle: Theme.of(context).textTheme.body2,
                  onChanged: (CountryCode countryCode) {
                    bloc.userRepo.updateStream(UserModel(
                        countryCode: countryCode.dialCode,
                        phone: bloc.userRepo.dataStream.value.getPhoneNumber));
                  },
                  initialSelection: '+251',
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 4,
                      right: MediaQuery.of(context).size.width / 4),
                  child: StreamBuilder(
                      stream: bloc.userRepo
                          .getStream<String>(bloc.validatePhoneNumber),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return TextField(
                          onChanged: (String enteredValue) {
                            bloc.userRepo.updateStream(UserModel(
                                countryCode: bloc
                                    .userRepo.dataStream.value.getCountryCode,
                                phone: enteredValue));
                          },
                          cursorColor: Theme.of(context).cursorColor,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              fontSize: 23,
                              color: Theme.of(context).textTheme.body2.color),
                          decoration: InputDecoration(
                              errorText: snapshot.data,
                              errorStyle: TextStyle(
                                  color: Theme.of(context).errorColor)),
                        );
                      })),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 5, top: 10),
                  child: Text(
                    "Please confirm your country code by clicking on the flag and enter your phone number",
                    style: Theme.of(context).textTheme.caption,
                  ))
            ],
          ),
        );
      },
    );
  }
}
