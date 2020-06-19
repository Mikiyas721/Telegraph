import './core/utils/preferenceKeys.dart';
import './models/theme.dart';
import './ui/pages/inviteFriendsPage.dart';
import './ui/pages/login/userInformationPage.dart';
import './ui/pages/settings/settings/privacyAndSecurity/passwordLock.dart';
import './models/chat.dart';
import './injector.dart';
import './ui/pages/callsPage.dart';
import './ui/pages/chattingPage.dart';
import './ui/pages/allContactsPage.dart';
import './ui/pages/contactsPage.dart';
import './ui/pages/login/phoneNumberInput.dart';
import './ui/pages/login/phoneVerification.dart';
import './ui/pages/news/channelDescription.dart';
import './ui/pages/news/newAccount.dart';
import './ui/pages/news/newChannel.dart';
import './ui/pages/news/newGroup.dart';
import './ui/pages/photoViewPage.dart';
import './ui/pages/searchPage.dart';
import './ui/pages/settings/info/changePhoneNumber.dart';
import './ui/pages/settings/info/changeUsername.dart';
import './ui/pages/settings/settings.dart';
import './ui/pages/settings/settings/chatBackground.dart';
import './ui/pages/settings/settings/dataAndStorage.dart';
import './ui/pages/settings/settings/languages.dart';
import './ui/pages/settings/settings/notificationAndSound.dart';
import './ui/pages/settings/settings/privacyAndSecurity/passwordPrompt.dart';
import './ui/pages/settings/settings/privacyAndSecurity/privacyAndSecurity.dart';
import './ui/pages/settings/settings/theme.dart';
import 'package:flutter/material.dart';
import './ui/pages/login/firstPage.dart';
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
  @override
  Widget build(BuildContext context) {
    final ThemeRepo repo = GetIt.instance.get();
    final loggedIn = repo.getPreference<bool>(PreferenceKeys.isLoggedIn) == null
        ? false
        : repo.getPreference<bool>(PreferenceKeys.isLoggedIn);
    final isLocked = repo.getPreference<bool>(PreferenceKeys.isLocked);
    repo.updateStream(ThemeModel(
        name: repo.getPreference<String>(PreferenceKeys.selectedTheme)));
    //TODO Remove the above code and put it in a bloc.
    final routes = {
      '/': (BuildContext context) =>
          loggedIn ? (isLocked ? PasswordLockPage() : HomePage()) : FirstPage(),
      '/homePage': (BuildContext context) => HomePage(),
      '/firstPage': (BuildContext context) => FirstPage(),
      '/phoneNumberInputPage': (BuildContext context) => PhoneNumberInputPage(),
      '/phoneVerificationPage': (BuildContext context) =>
          PhoneVerificationPage(),
      '/userInformationPage': (BuildContext context) => UserInformationPage(),
      '/chattingPage': (BuildContext context) =>
          ChattingPage(),
      '/searchPage': (BuildContext context) => SearchPage(),
      '/contactsPage': (BuildContext context) => ContactsPage(),
      '/allContactsPage': (BuildContext context) => AllContactsPage(),
      '/inviteFriendsPage': (BuildContext context) => InviteFriendsPage(),
      '/newGroupPage': (BuildContext context) => NewGroupPage(''),
      '/newChannelPage': (BuildContext context) => NewChannelPage(),
      '/newContactPage': (BuildContext context) => NewContactPage(),
      '/channelDescriptionPage': (BuildContext context) =>
          ChannelDescriptionPage(),
      '/callsPage': (BuildContext context) => CallsPage(),
      '/settingPage': (BuildContext context) => SettingPage(),
      '/changePhoneNumberPage': (BuildContext context) =>
          ChangePhoneNumberPage(),
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
      '/photoViewPage': (BuildContext context) => PhotoViewPage()
    };
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
}
