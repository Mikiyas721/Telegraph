import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/resources/myThemeData.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class ThemeBloc extends Disposable {
  final BehaviorSubject<ThemeData> selectedThemeStream = BehaviorSubject<ThemeData>();

  Stream<ThemeData> get selectedThemeData => selectedThemeStream.map((selectedValue)=>selectedValue);
  Function(ThemeData themeData) get setSelectedThemeData => selectedThemeStream.add;

  Stream<String> get selectedThemeDataString => selectedThemeStream.map(mapThemeDataToString);

  String mapThemeDataToString(ThemeData themeData){
    if(themeData == MyThemeData.themeDark) return "Dark";
    else return "Default";
  }
  ThemeData mapStringToThemeData(String themeDataString){
    if(themeDataString=="Dark") return MyThemeData.themeDark;
    else return MyThemeData.defaultTheme;
  }

  @override
  void dispose() {
    selectedThemeStream.close();
  }
}
