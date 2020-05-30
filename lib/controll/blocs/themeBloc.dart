import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/controll/others/myThemeData.dart';
import 'package:Telegraph/data/theme_datasouce.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/subjects.dart';

class ThemeBloc extends Disposable {
  //ThemeRepo get themeRepo=>GetIt.instance.get<ThemeRepo>();

  final BehaviorSubject<ThemeData> selectedThemeStream = BehaviorSubject<ThemeData>();

  Stream<ThemeData> get selectedThemeData => selectedThemeStream.map((selectedValue)=>selectedValue);
  Function(ThemeData themeData) get setSelectedThemeData => selectedThemeStream.add;

  Stream<String> get selectedThemeDataString => selectedThemeStream.map(mapThemeDataToString);

  String mapThemeDataToString(ThemeData themeData){
    if(themeData == MyThemeData.defaultDark) return "DefaultDark";
    else if(themeData == MyThemeData.defaultLerp) return "DefaultLerp";
    else if(themeData == MyThemeData.darkBlue) return "DarkBlue";
    else return "DefaultLight";
  }
  ThemeData mapStringToThemeData(String themeDataString){
    if(themeDataString=="DefaultDark") return MyThemeData.defaultDark;
    else if(themeDataString=="DefaultLerp") return MyThemeData.defaultLerp;
    else if(themeDataString=="DarkBlue") return MyThemeData.darkBlue;
    else return MyThemeData.defaultLight;
  }

 /* changeTheme(String name){
    themeRepo.update(MyTheme(name:name));
  }*/

  @override
  void dispose() {
    selectedThemeStream.close();
  }
}
