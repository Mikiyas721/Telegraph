import 'package:Telegraph/data/callDataSource.dart';
import 'package:Telegraph/data/contactDatasource.dart';
import 'package:Telegraph/data/messageDataSource.dart';
import 'package:Telegraph/models/call.dart';
import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/models/contact.dart';
import 'package:Telegraph/models/message.dart';
import 'package:Telegraph/models/password.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/chatDataSource.dart';
import 'data/passwordDataSource.dart';
import 'data/userDataSource.dart';
import 'data/themeDatasouce.dart';
import 'data/valueDataSource.dart';
import 'models/theme.dart';
import 'models/user.dart';
import 'models/value.dart';

inject() async {
  final pref = await SharedPreferences.getInstance();
  GetIt.instance.registerSingleton(pref);

  GetIt.instance.registerLazySingleton<ValueRepo>(() => ValueRepo(BehaviorSubject<ValueModel>()));
  GetIt.instance.registerLazySingleton<UserRepo>(() => UserRepo(BehaviorSubject<UserModel>()));
  GetIt.instance.registerLazySingleton<ThemeRepo>(() => ThemeRepo(BehaviorSubject<ThemeModel>()));
  GetIt.instance.registerLazySingleton<PasswordRepo>(() => PasswordRepo(BehaviorSubject<PasswordModel>()));

  GetIt.instance.registerLazySingleton<ContactListRepo>(() => ContactListRepo(BehaviorSubject<List<ContactModel>>()));
  GetIt.instance.registerLazySingleton<ContactRepo>(() => ContactRepo(BehaviorSubject<ContactModel>()));

  GetIt.instance.registerLazySingleton<ChatListRepo>(() => ChatListRepo(BehaviorSubject<List<ChatModel>>()));
  GetIt.instance.registerLazySingleton<ChatRepo>(() => ChatRepo(BehaviorSubject<ChatModel>()));

  GetIt.instance.registerLazySingleton<CallRepo>(() => CallRepo(BehaviorSubject<List<CallModel>>()));
  GetIt.instance.registerLazySingleton<MessageRepo>(() => MessageRepo(BehaviorSubject<List<MessageModel>>()));
}
