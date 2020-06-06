import './models/chat.dart';
import 'package:Telegraph/injector.dart';
import 'package:Telegraph/ui/pages/callsPage.dart';
import 'package:Telegraph/ui/pages/chattingPage.dart';
import 'package:Telegraph/ui/pages/allContactsPage.dart';
import 'package:Telegraph/ui/pages/contactsPage.dart';
import 'package:Telegraph/ui/pages/login/phoneNumberInput.dart';
import 'package:Telegraph/ui/pages/login/phoneVerification.dart';
import 'package:Telegraph/ui/pages/news/channelDescription.dart';
import 'package:Telegraph/ui/pages/news/newAccount.dart';
import 'package:Telegraph/ui/pages/news/newChannel.dart';
import 'package:Telegraph/ui/pages/news/newGroup.dart';
import 'package:Telegraph/ui/pages/photoViewPage.dart';
import 'package:Telegraph/ui/pages/searchPage.dart';
import 'package:Telegraph/ui/pages/settings/info/changePhoneNumber.dart';
import 'package:Telegraph/ui/pages/settings/info/changeUsername.dart';
import 'package:Telegraph/ui/pages/settings/settings.dart';
import 'package:Telegraph/ui/pages/settings/settings/chatBackground.dart';
import 'package:Telegraph/ui/pages/settings/settings/dataAndStorage.dart';
import 'package:Telegraph/ui/pages/settings/settings/languages.dart';
import 'package:Telegraph/ui/pages/settings/settings/notificationAndSound.dart';
import 'package:Telegraph/ui/pages/settings/settings/privacyAndSecurity/passwordPrompt.dart';
import 'package:Telegraph/ui/pages/settings/settings/privacyAndSecurity/privacyAndSecurity.dart';
import 'package:Telegraph/ui/pages/settings/settings/theme.dart';
import 'package:flutter/material.dart';
import 'package:Telegraph/ui/pages/login/firstPage.dart';
import 'package:get_it/get_it.dart';
import 'data/themeDatasouce.dart';
import 'others/myThemeData.dart';
import 'ui/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final bool loggedIn = false;
  @override
  Widget build(BuildContext context) {
    final ThemeRepo repo = GetIt.instance.get();
    return StreamBuilder<ThemeData>(
        stream: repo.themeDataStream,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          return MaterialApp(
            title: 'Telegraph',
            initialRoute: '/',
            routes: routes,
            theme: snapshot.data == null
                ? MyThemeData.defaultLight
                : snapshot.data,
          );
        });
  }

  final routes = {
    '/': (BuildContext context) => loggedIn ? HomePage() : FirstPage(),
    '/homePage':(BuildContext context)=>HomePage(),
    'firstPage': (BuildContext context) => FirstPage(),
    '/phoneNumberInputPage': (BuildContext context) => PhoneNumberInputPage(
          themeData: Theme.of(context),
        ),
    '/phoneVerificationPage': (BuildContext context) => PhoneVerificationPage(
          '',
          themeData: Theme.of(context),
        ),
    '/chattingPage': (BuildContext context) =>
        ChattingPage('Kebede', '', ChatType.SINGLE),
    '/searchPage': (BuildContext context) => SearchPage(),
    '/contactsPage': (BuildContext context) => ContactsPage(),
    '/allContactsPage': (BuildContext context) => AllContactsPage(),
    '/newGroupPage': (BuildContext context) => NewGroupPage(''),
    '/newChannelPage': (BuildContext context) => NewChannelPage(),
    '/newContactPage': (BuildContext context)=> NewContactPage(),
    '/channelDescriptionPage': (BuildContext context) =>
        ChannelDescriptionPage(),
    '/callsPage': (BuildContext context)=>CallsPage(),
    '/settingPage': (BuildContext context) => SettingPage(),
    '/changePhoneNumberPage': (BuildContext context) => ChangePhoneNumberPage(),
    '/changeUserNamePage': (BuildContext context) => ChangeUserNamePage(),
    '/notificationAndSoundsPage': (BuildContext context) =>
        NotificationAndSoundsPage(),
    '/privacyAndSecurityPage': (BuildContext context) =>
        PrivacyAndSecurityPage(),
    '/passwordEnteringPage': (BuildContext context) => PasswordEnteringPage(),
    '/dataAndStoragePage': (BuildContext context) => DataAndStoragePage(),
    '/chatBackgroundPage': (BuildContext context) => ChatBackgroundPage(),
    '/themePage': (BuildContext context) => ThemePage(),
    '/languagesPage': (BuildContext context) => LanguagesPage(),
    '/photoViewPage':(BuildContext context)=>PhotoViewPage()
  };
}
