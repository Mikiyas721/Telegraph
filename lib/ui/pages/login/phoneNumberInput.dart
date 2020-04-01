import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:telegraph/ui/pages/login/phoneVerification.dart';

class PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Phone Number",
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
          title: Text(
            "Your phone",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PhoneVerification(
                              "We've sent a verification code to the telegraph account on your other device.")));
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Choose your country"),
              trailing: CountryCodePicker(
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 19),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 5, top: 10),
                child: Text(
                  "Please confirm your country code by clicking on the flag and enter your phone number",
                  style: TextStyle(color: Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
