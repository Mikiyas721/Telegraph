import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/themeDatasouce.dart';
import 'package:Telegraph/models/theme.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:get_it/get_it.dart';

class ThemeBloc extends Disposable {
  ThemeRepo get themeRepo => GetIt.instance.get();

  void changeTheme(String name) async {
    themeRepo.updateStream(ThemeModel(name: name));
    await themeRepo.setPreference<String>(PreferenceKeys.selectedTheme, name);
  }

  void nextTheme() async {
    String currentTheme =
        themeRepo.getPreference<String>(PreferenceKeys.selectedTheme);
    if (currentTheme == null) currentTheme = "DefaultLight";
    if (currentTheme == "DefaultLight") {
      themeRepo.updateStream(ThemeModel(name: "DefaultDark"));
      await themeRepo.setPreference<String>(
          PreferenceKeys.selectedTheme, "DefaultDark");
    } else if (currentTheme == "DefaultDark") {
      themeRepo.updateStream(ThemeModel(name: "DarkBlue"));
      await themeRepo.setPreference<String>(PreferenceKeys.selectedTheme, "DarkBlue");
    } else if (currentTheme == "DarkBlue") {
      themeRepo.updateStream(ThemeModel(name: "DefaultLerp"));
      await themeRepo.setPreference<String>(
          PreferenceKeys.selectedTheme, "DefaultLerp");
    } else {
      themeRepo.updateStream(ThemeModel(name: "DefaultLight"));
      await themeRepo.setPreference<String>(
          PreferenceKeys.selectedTheme, "DefaultLight");
    }
  }

  @override
  void dispose() {}
}
