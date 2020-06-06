import 'package:Telegraph/data/callDataSource.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/repository.dart';
import 'data/chatDataSource.dart';
import 'data/passwordDataSource.dart';
import 'data/themeDatasouce.dart';
import 'models/call.dart';
import 'models/chat.dart';
import 'models/contact.dart';
import 'models/password.dart';
import 'models/theme.dart';

inject() async {
  final pref = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(pref);

  GetIt.instance
      .registerLazySingleton<ThemeDataSource>(() => CacheThemeDataSource(
            GetIt.instance.get(),
          ));
  GetIt.instance.registerLazySingleton<ThemeRepo>(() => ThemeRepo('main'));
  GetIt.instance.registerLazySingleton<ItemRepoManager<ThemeModel>>(
    () => SingleItemRepoManager<ThemeModel>(),
  );

  GetIt.instance
      .registerLazySingleton<PasswordDataSource>(() => CachePasswordDataSource(
            GetIt.instance.get(),
          ));
  GetIt.instance
      .registerLazySingleton<PasswordRepo>(() => PasswordRepo('main'));
  GetIt.instance.registerLazySingleton<ItemRepoManager<PasswordModel>>(
    () => SingleItemRepoManager<PasswordModel>(),
  );

  GetIt.instance.registerLazySingleton<ContactDataSource>(
      () => CacheContactDataSource(GetIt.instance.get()));
  GetIt.instance.registerLazySingleton<ContactRepo>(() => ContactRepo('main'));
  GetIt.instance.registerLazySingleton<ListRepoManager<ContactModel>>(
    () => SingleListRepoManager<ContactModel>(),
  );

  GetIt.instance.registerLazySingleton<CallDataSource>(
      () => CacheCallDataSource(GetIt.instance.get()));
  GetIt.instance.registerLazySingleton<CallRepo>(() => CallRepo('main'));
  GetIt.instance.registerLazySingleton<ListRepoManager<CallModel>>(
    () => SingleListRepoManager<CallModel>(),
  );

  GetIt.instance.registerLazySingleton<ChatDataSource>(
      () => CacheChatDataSource(GetIt.instance.get()));
  GetIt.instance.registerLazySingleton<ChatRepo>(() => ChatRepo('main'));
  GetIt.instance.registerLazySingleton<ListRepoManager<ChatModel>>(
    () => SingleListRepoManager<ChatModel>(),
  );
}
