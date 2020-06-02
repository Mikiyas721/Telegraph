import 'package:Telegraph/core/json_model.dart';
import 'package:Telegraph/others/myThemeData.dart';
import 'package:flutter/material.dart';

class MyTheme extends JSONModel{
  final String name;

  MyTheme({this.name}):super(name);

  @override
  Map<String, dynamic> toMap() {
    return {
      'name':name
    };
  }

  factory MyTheme.fromMap(Map<String,dynamic> map){
    return MyTheme(name:map['name']);
  }

  ThemeData get generateTheme{
    if(this.name=="DefaultDark") return MyThemeData.defaultDark;
    else if(this.name=="DefaultLerp") return MyThemeData.defaultLerp;
    else if(this.name=="DarkBlue") return MyThemeData.darkBlue;
    else return MyThemeData.defaultLight;
  }
}