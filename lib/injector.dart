import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controll/others/myThemeData.dart';
import 'core/repository.dart';
import 'data/theme_datasouce.dart';

inject() async {
  final pref = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(pref);

  GetIt.instance
      .registerLazySingleton<ThemeDataSource>(() => CacheThemeDataSource(
            GetIt.instance.get(),
          ));
  GetIt.instance.registerLazySingleton<ThemeRepo>(() => ThemeRepo('main'));
  GetIt.instance.registerLazySingleton<ItemRepoManager<MyTheme>>(
    () => SingleItemRepoManager<MyTheme>(),
  );
}
