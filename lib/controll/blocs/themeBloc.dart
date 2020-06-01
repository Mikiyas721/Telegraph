import 'package:Telegraph/controll/others/myThemeData.dart';
import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';
import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/theme_datasouce.dart';
import 'package:get_it/get_it.dart';

class ThemeBloc extends Disposable {
  ThemeRepo get themeRepo => GetIt.instance.get<ThemeRepo>();

  changeTheme(String name) async {
    themeRepo.update(MyTheme(name: name));
    await PreferenceHandler.setPreference<String>(
        PreferenceHandler.selectedTheme, name);
  }

  nextTheme() async {
    String currentTheme =
        PreferenceHandler.getPreference(PreferenceHandler.selectedTheme);
    print(currentTheme);
    if (currentTheme == "DefaultLight") {
      themeRepo.update(MyTheme(name: "DefaultDark"));
      await PreferenceHandler.setPreference<String>(
          PreferenceHandler.selectedTheme, "DefaultDark");
    } else if (currentTheme == "DefaultDark") {
      themeRepo.update(MyTheme(name: "DarkBlue"));
      await PreferenceHandler.setPreference<String>(
          PreferenceHandler.selectedTheme, "DarkBlue");
    } else if (currentTheme == "DarkBlue") {
      themeRepo.update(MyTheme(name: "DefaultLerp"));
      await PreferenceHandler.setPreference<String>(
          PreferenceHandler.selectedTheme, "DefaultLerp");
    } else {
      themeRepo.update(MyTheme(name: "DefaultLight"));
      await PreferenceHandler.setPreference<String>(
          PreferenceHandler.selectedTheme, "DefaultLight");
    }
  }

  @override
  void dispose() {}
}
