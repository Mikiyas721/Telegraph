import 'package:Telegraph/controll/others/sharedPreferenceHandler.dart';

class Assistant {
  static DateTime getDateTime(String dateString) {
    List<String> split = dateString.split('T');
    List<String> date = split[0].split('-');
    List<String> time = split[1].split(':');
    List<String> seconds = split[2].split('.');
    return DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]),
        int.parse(time[0]), int.parse(time[1]), int.parse(seconds[0]));
  }

  static String getDateString(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}T${dateTime.hour}:${dateTime.minute}:${dateTime.second}.${dateTime.millisecond}Z';
  }

  static void setUpDefaults() {
    PreferenceHandler.setPreference<bool>(PreferenceHandler.messageAlert, true);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.messagePreview, false);
    PreferenceHandler.setPreference<String>(PreferenceHandler.messageVibrate, "Default");
    PreferenceHandler.setPreference<String>(PreferenceHandler.messagePopup, "No popup");
    PreferenceHandler.setPreference<String>(PreferenceHandler.messageSound, "No popup");
    PreferenceHandler.setPreference<String>(PreferenceHandler.messagePriority, "Default");

    PreferenceHandler.setPreference<bool>(PreferenceHandler.groupAlert, false);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.groupPreview, true);
    PreferenceHandler.setPreference<String>(PreferenceHandler.groupVibrate, "Default");
    PreferenceHandler.setPreference<String>(PreferenceHandler.groupPopup, "No popup");
    PreferenceHandler.setPreference<String>(PreferenceHandler.groupSound, "No popup");
    PreferenceHandler.setPreference<String>(PreferenceHandler.groupPriority, "Default");

    PreferenceHandler.setPreference<bool>(PreferenceHandler.inAppSound, false);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.inAppVibrate, true);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.inAppPreview, true);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.inChatSound, false);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.inAppPriority, false);

    PreferenceHandler.setPreference<String>(PreferenceHandler.whoViewLastSeen, "My Contacts");
    PreferenceHandler.setPreference<String>(PreferenceHandler.whoCanCallMe, "My Contacts");

    PreferenceHandler.setPreference<String>(PreferenceHandler.onMobileData, "No Media");
    PreferenceHandler.setPreference<String>(PreferenceHandler.onWifi, "No Media");

    PreferenceHandler.setPreference<String>(PreferenceHandler.chatBackground, "assets/chatBackground_8.jpeg");

    PreferenceHandler.setPreference<String>(PreferenceHandler.selectedTheme, "DefaultLight");

    PreferenceHandler.setPreference<String>(PreferenceHandler.selectedTheme, "English");

    PreferenceHandler.setPreference<bool>(PreferenceHandler.enableAnimation, true);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.inAppBrowser, false);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.directShare, true);
    PreferenceHandler.setPreference<int>(PreferenceHandler.messageTextSize, 12);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.raiseToSpeak, false);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.sendByEnter, true);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.autoPlayGIF, false);
    PreferenceHandler.setPreference<bool>(PreferenceHandler.saveToGallery, false);
  }
}
