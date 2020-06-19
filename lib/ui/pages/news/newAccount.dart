import '../../../blocs/contactBloc.dart';
import '../../../blocs/provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class NewContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      blocFactory: () => ContactBloc(),
      builder: (BuildContext context, ContactBloc bloc) {
        final width = MediaQuery.of(context).size.width;
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
              "New Account",
              style: TextStyle(
                  color: Theme.of(context).textTheme.body2.color,
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.check,
                      color: Theme.of(context).iconTheme.color),
                  onPressed: () async {
                    bool wasAdded = await bloc.addAccount();
                    wasAdded
                        ? Toast.show('Successfully Added', context)
                        : Toast.show('Not Successfull', context);
                  })
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width) * 0.2,
                    right: (MediaQuery.of(context).size.width) * 0.2,
                    top: 10,
                    bottom: 10),
                child: TextField(
                  onChanged: (String enteredValue) {
                    bloc.updateAccountValue(enteredValue, 'firstName');
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "First Name(required)",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                child: TextField(
                    onChanged: (String enteredValue) {
                      bloc.updateAccountValue(enteredValue, 'lastName');
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Last Name(optional)",
                        hintStyle: TextStyle(color: Colors.grey))),
              ),
              CountryCodePicker(
                initialSelection: "+251",
                onChanged: (CountryCode countryCode) {
                  bloc.updateAccountValue(countryCode.code, 'countryCode');
                },
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onSubmitted: (String newValue) {
                      bloc.updateAccountValue(newValue, 'firstName');
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(),
                  ))
            ],
          ),
        );
      },
    );
  }
}
