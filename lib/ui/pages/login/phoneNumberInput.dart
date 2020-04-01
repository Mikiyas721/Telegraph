import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

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
                          builder: (BuildContext context) => null));
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            CountryCodePicker(
              onChanged: (CountryCode countryCode) {},
              initialSelection: 'ETH',
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(prefix: Text("+")),
                  ),
                  TextField(),
                ],
              ),
            ),
            Text(
              "Please confirm your country code and enter your phone number",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
