import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/login/phoneVerification.dart';

class PhoneNumberInput extends StatelessWidget {
  final ThemeData themeData;
  PhoneNumberInput({this.themeData});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Phone Number",
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeData.iconTheme.color,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Your phone",
            style: themeData.textTheme.title,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: themeData.iconTheme.color,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PhoneVerification(
                              "We've sent a verification code to the telegraph account on your other device.", themeData:themeData)));
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Choose your country",style: themeData.textTheme.body2,),
              trailing: CountryCodePicker(
                textStyle: themeData.textTheme.body2,
                onChanged: (CountryCode countryCode) {},
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
              child: TextField(
                cursorColor: themeData.cursorColor,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 23, color: themeData.textTheme.body2.color),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 5, top: 10),
                child: Text(
                  "Please confirm your country code by clicking on the flag and enter your phone number",
                  style: themeData.textTheme.caption,
                ))
          ],
        ),
      ),
    );
  }
}
