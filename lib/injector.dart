import 'package:Telegraph/data/callDataSource.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/models/call.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/models/password.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/chatDataSource.dart';
import 'data/passwordDataSource.dart';
import 'data/themeDatasouce.dart';
import 'models/theme.dart';

inject() async {
  final pref = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(pref);

  GetIt.instance.registerLazySingleton<ThemeRepo>(() => ThemeRepo(BehaviorSubject<ThemeModel>()));
  GetIt.instance.registerLazySingleton<PasswordRepo>(() => PasswordRepo(BehaviorSubject<PasswordModel>()));

  GetIt.instance.registerLazySingleton<ContactRepo>(() => ContactRepo(BehaviorSubject<List<ContactModel>>()));

  GetIt.instance.registerLazySingleton<CallRepo>(() => CallRepo(BehaviorSubject<List<CallModel>>()));
  GetIt.instance.registerLazySingleton<ChatRepo>(() => ChatRepo(BehaviorSubject<List<ChatModel>>()));
}
