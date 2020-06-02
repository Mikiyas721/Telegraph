import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/themeDatasouce.dart';
import 'package:Telegraph/models/theme.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:get_it/get_it.dart';

class ThemeBloc extends Disposable {
  ThemeRepo get themeRepo => GetIt.instance.get<ThemeRepo>();
  CacheThemeDataSource themeCache = CacheThemeDataSource(GetIt.instance.get());

  changeTheme(String name) async {
    themeRepo.update(MyTheme(name: name));
    await themeCache.setObject(
        PreferenceKeys.selectedTheme, MyTheme(name: name).toMap());
  }

  nextTheme() async {
    MyTheme currentTheme =
        MyTheme.fromMap(themeCache.getObject(PreferenceKeys.selectedTheme));
    if (currentTheme.id == "DefaultLight") {
      themeRepo.update(MyTheme(name: "DefaultDark"));
      await themeCache.setObject(PreferenceKeys.selectedTheme,
          MyTheme(name: "DefaultDark").toMap());
    } else if (currentTheme.id == "DefaultDark") {
      themeRepo.update(MyTheme(name: "DarkBlue"));
      await themeCache.setObject(
          PreferenceKeys.selectedTheme, MyTheme(name: "DarkBlue").toMap());
    } else if (currentTheme.id == "DarkBlue") {
      themeRepo.update(MyTheme(name: "DefaultLerp"));
      await themeCache.setObject(PreferenceKeys.selectedTheme,
          MyTheme(name: "DefaultLerp").toMap());
    } else {
      themeRepo.update(MyTheme(name: "DefaultLight"));
      await themeCache.setObject(PreferenceKeys.selectedTheme,
          MyTheme(name: "DefaultLight").toMap());
    }
  }

  @override
  void dispose() {}
}
