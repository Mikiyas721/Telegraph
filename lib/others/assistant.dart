import 'package:Telegraph/models/chat.dart';
import 'package:Telegraph/others/preferenceKeys.dart';
import 'package:Telegraph/ui/customWidgets/chatListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class Assistant {
  static DateTime getDateTime(String dateString) {
    List<String> split = dateString.split('T');
    List<String> date = split[0].split('-');
    List<String> time = split[1].split(':');
    List<String> second = time[2].split('.');
    return DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]),
        int.parse(time[0]), int.parse(time[1]), int.parse(second[0]));
  }

  static String getDateString(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}T${dateTime.hour}:${dateTime.minute}:${dateTime.second}.${dateTime.millisecond}Z';
  }

  static void setUpDefaults() {
    PreferenceKeys.setPreference<bool>(PreferenceKeys.messageAlert, true);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.messagePreview, false);
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.messageVibrate, "Default");
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.messagePopup, "No popup");
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.messageSound, "No popup");
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.messagePriority, "Default");

    PreferenceKeys.setPreference<bool>(PreferenceKeys.groupAlert, false);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.groupPreview, true);
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.groupVibrate, "Default");
    PreferenceKeys.setPreference<String>(PreferenceKeys.groupPopup, "No popup");
    PreferenceKeys.setPreference<String>(PreferenceKeys.groupSound, "No popup");
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.groupPriority, "Default");

    PreferenceKeys.setPreference<bool>(PreferenceKeys.inAppSound, false);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.inAppVibrate, true);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.inAppPreview, true);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.inChatSound, false);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.inAppPriority, false);

    PreferenceKeys.setPreference<String>(
        PreferenceKeys.whoViewLastSeen, "My Contacts");
    PreferenceKeys.setPreference<String>(
        PreferenceKeys.whoCanCallMe, "My Contacts");

    PreferenceKeys.setPreference<String>(
        PreferenceKeys.onMobileData, "No Media");
    PreferenceKeys.setPreference<String>(PreferenceKeys.onWifi, "No Media");

    PreferenceKeys.setPreference<String>(
        PreferenceKeys.chatBackground, "assets/chatBackground_8.jpeg");

    PreferenceKeys.setPreference<String>(
        PreferenceKeys.selectedTheme, "DefaultLight");

    PreferenceKeys.setPreference<String>(
        PreferenceKeys.selectedTheme, "English");

    PreferenceKeys.setPreference<bool>(PreferenceKeys.enableAnimation, true);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.inAppBrowser, false);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.directShare, true);
    PreferenceKeys.setPreference<int>(PreferenceKeys.messageTextSize, 12);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.raiseToSpeak, false);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.sendByEnter, true);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.autoPlayGIF, false);
    PreferenceKeys.setPreference<bool>(PreferenceKeys.saveToGallery, false);

    PreferenceKeys.setPreference<bool>(PreferenceKeys.isLocked, false);
  }

  static Future<Map<Permission, PermissionStatus>> getPermissions() async {
    return await [
      Permission.contacts,
    ].request();
  }

  static List<Widget> getPlaceHolderContacts() {
    List<Widget> widgets = List<Widget>();
    for (int i = 0; i < 20; i++) {
      widgets.add(
        ChatListItem(
          imageURL: "assets/avatar_1.png",
          title: "Rotractors",
          lastChatDateTime: DateTime.now(),
          lastChatString: "Hi,How are you",
          chatType: ChatType.SINGLE,
        ),
      );
    }
    return widgets;
  }
}
