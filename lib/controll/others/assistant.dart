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

  static bool getBoolean(String bool) {
    if (bool == 'true')
      return true;
    else
      return false;
  }

  static void setUpDefaults() {
    SharedPreferenceHandler instance = SharedPreferenceHandler.getInstance();

    instance.setMessageAlert(true);
    instance.setMessagePreview(false);
    instance.setMessageVibrate("Default");
    instance.setMessagePopup("No popup");
    instance.setMessageSound("No popup");
    instance.setMessagePriority("Default");

    instance.setGroupAlert(false);
    instance.setGroupPreview(true);
    instance.setGroupVibrate("Default");
    instance.setGroupPopup("No popup");
    instance.setGroupSound("No popup");
    instance.setGroupPriority("Default");

    instance.setInAppSound(false);
    instance.setInAppVibrate(true);
    instance.setInAppPreview(true);
    instance.setInChatSound(false);
    instance.setInAppPriority(false);

    instance.setWhoViewLastSeen("My Contacts");
    instance.setWhoCanCallMe("My Contacts");

    instance.setMediaDownloadOnData("No Media");
    instance.setMediaDownloadOnWifi("No Media");

    instance.setChatBackground(" ");

    instance.setSelectedTheme("Default");

    instance.setAppLanguage("English");

    instance.setEnableAnimation(true);
    instance.setInAppBrowser(false);
    instance.setDirectShare(true);
    instance.setMessageTextSize(12);
    instance.setRaiseToSpeak(false);
    instance.setSendByEnter(true);
    instance.setAutoPlayGIF(false);
    instance.setSaveToGallery(false);
  }
}
