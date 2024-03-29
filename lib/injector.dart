import './data/callDataSource.dart';
import './data/contactDatasource.dart';
import './data/messageDataSource.dart';
import './models/call.dart';
import './models/chat.dart';
import './models/contact.dart';
import './models/message.dart';
import './models/password.dart';
import './data/chatDataSource.dart';
import './data/passwordDataSource.dart';
import './data/userDataSource.dart';
import './data/themeDatasouce.dart';
import './data/valueDataSource.dart';
import './models/theme.dart';
import './models/user.dart';
import './models/value.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
