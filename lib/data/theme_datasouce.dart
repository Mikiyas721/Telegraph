import 'package:Telegraph/controll/others/myThemeData.dart';
import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDataSource implements CRUDSource<MyTheme>{

}

class CacheThemeDataSource extends CacheCRUDSource<MyTheme> implements ThemeDataSource{
  CacheThemeDataSource(SharedPreferences preference) : super(preference, 'theme', (map)=>MyTheme.fromMap(map));
}


class ThemeRepo extends ItemRepo<MyTheme,ThemeDataSource>{
  ThemeRepo(String key) : super(key){
    get();
  }

  Stream<ThemeData> get themeDataStream{
    return item.map((theme)=>theme.generateTheme);
  }
}
