import 'package:Telegraph/data/theme_datasouce.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controll/others/myThemeData.dart';
import 'core/repo.dart';

inject() async {
  final pref = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(pref);

  GetIt.instance
      .registerLazySingleton<ThemeDatasource>(() => CacheThemeDatasource(
            GetIt.instance.get(),
          ));
  GetIt.instance.registerLazySingleton<ThemeRepo>(() => ThemeRepo('main'));
  GetIt.instance.registerLazySingleton<ItemRepoManager<MyTheme>>(
    () => SingleItemRepoManager<MyTheme>(),
  );
}
