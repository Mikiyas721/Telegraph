import 'package:Telegraph/controll/others/myThemeData.dart';
import 'package:Telegraph/core/datasource.dart';
import 'package:Telegraph/core/repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDatasource implements CRUDSource<MyTheme>{

}

class CacheThemeDatasource extends CacheCRUDSource<MyTheme> implements ThemeDatasource{
  CacheThemeDatasource(SharedPreferences preference) : super(preference, 'theme', (map)=>MyTheme.fromMap(map));
}


class ThemeRepo extends ItemRepo<MyTheme,ThemeDatasource>{
  ThemeRepo(String key) : super(key){
    get();
  }

  Stream<ThemeData> get themeDataStream{
    return item.map((theme)=>theme.generateTheme);
}
}
