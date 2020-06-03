import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/themeDatasouce.dart';
import 'package:Telegraph/models/theme.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:get_it/get_it.dart';

class ThemeBloc extends Disposable {
  ThemeRepo get themeRepo => GetIt.instance.get<ThemeRepo>();
  CacheThemeDataSource themeCache = CacheThemeDataSource(GetIt.instance.get());

  changeTheme(String name) async {
    themeRepo.update(ThemeModel(name: name));
    await themeCache.setObject(
        PreferenceKeys.selectedTheme, ThemeModel(name: name).toMap());
  }

  nextTheme() async {
    ThemeModel currentTheme =
        ThemeModel.fromMap(themeCache.getObject(PreferenceKeys.selectedTheme));
    if (currentTheme.id == "DefaultLight") {
      themeRepo.update(ThemeModel(name: "DefaultDark"));
      await themeCache.setObject(PreferenceKeys.selectedTheme,
          ThemeModel(name: "DefaultDark").toMap());
    } else if (currentTheme.id == "DefaultDark") {
      themeRepo.update(ThemeModel(name: "DarkBlue"));
      await themeCache.setObject(
          PreferenceKeys.selectedTheme, ThemeModel(name: "DarkBlue").toMap());
    } else if (currentTheme.id == "DarkBlue") {
      themeRepo.update(ThemeModel(name: "DefaultLerp"));
      await themeCache.setObject(PreferenceKeys.selectedTheme,
          ThemeModel(name: "DefaultLerp").toMap());
    } else {
      themeRepo.update(ThemeModel(name: "DefaultLight"));
      await themeCache.setObject(PreferenceKeys.selectedTheme,
          ThemeModel(name: "DefaultLight").toMap());
    }
  }

  @override
  void dispose() {}
}
