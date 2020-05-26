import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:Telegraph/resources/myThemeData.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class ThemeBloc extends Disposable {
  final selectedThemeStream = BehaviorSubject();

  Stream<ThemeData> get selectedTheme =>
      selectedThemeStream.map((selectedValue) {
        if (selectedValue == "Default")
          return MyThemeData.defaultTheme;
        else
          return MyThemeData.themeDark;
      });

  Function(String selectedValue) get setSelectedTheme =>
      selectedThemeStream.add;

  @override
  void dispose() {
    selectedThemeStream.close();
  }
}
