import 'package:Telegraph/core/dataSource.dart';
import 'package:Telegraph/core/repository.dart';
import 'package:Telegraph/models/theme.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDataSource implements CRUDSource<ThemeModel> {}

class CacheThemeDataSource extends CacheCRUDSource<ThemeModel>
    implements ThemeDataSource {
  CacheThemeDataSource(SharedPreferences preference)
      : super(preference, PreferenceKeys.selectedTheme,
            (map) => ThemeModel.fromMap(map));
}

class ThemeRepo extends ItemRepo<ThemeModel, ThemeDataSource> {
  ThemeRepo(String key) : super(key) {
    get();
  }

  Stream<ThemeData> get themeDataStream {
    return item.map((theme) => theme.generateTheme);
  }
}
