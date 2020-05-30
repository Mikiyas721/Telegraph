import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

//this class could be static, no need to create an object
class PreferenceHandler {
  static final String messageAlert = 'MessageAlert';
  static final String messagePreview = 'MessagePreview';
  static final String messageVibrate = 'MessageVibrate';
  static final String messagePopup = 'MessagePopup';
  static final String messageSound = 'MessageSound';
  static final String messagePriority = 'MessagePriority';
  static final String groupAlert = 'GroupAlert';
  static final String groupPreview = 'GroupPreview';
  static final String groupVibrate = 'GroupVibrate';
  static final String groupPopup = 'GroupPopup';
  static final String groupSound = 'GroupSound';
  static final String groupPriority = 'GroupPriority';
  static final String inAppSound = 'InAppSound';
  static final String inAppVibrate = 'InAppVibrate';
  static final String inAppPreview = 'InAppPreview';
  static final String inChatSound = 'InChatSound';
  static final String inAppPriority = 'InAppPriority';
  static final String whoViewLastSeen = 'WhoViewLastSeen';
  static final String whoCanCallMe = 'WhoCanCallMe';
  static final String userPassword = 'UserPassword';
  static final String onMobileData = 'MediaDownloadOnMobileData';
  static final String onWifi = 'MediaDownloadOnWifi';
  static final String chatBackground = 'ChatBackground';
  static final String selectedTheme = 'SelectedTheme';
  static final String language = 'Language';
  static final String enableAnimation = 'EnableAnimation';
  static final String inAppBrowser = 'InAppBrowser';
  static final String directShare = 'DirectShare';
  static final String messageTextSize = 'MessageTextSize';
  static final String raiseToSpeak = 'RaiseToSpeak';
  static final String sendByEnter = 'SendByEnter';
  static final String saveToGallery = 'SaveToGallery';
  static final String autoPlayGIF = 'AutoPlayGIF';

  static getPreference(String key) {
    SharedPreferences instance = GetIt.instance.get();
    return instance.get(key);
  }

  static Future<bool> setPreference<T>(String key, value) async {
    SharedPreferences instance = GetIt.instance.get();
    if(T.runtimeType==String) return await instance.setString(key,value);
    else if(T.runtimeType==bool) return await instance.setBool(key,value);
    else if(T.runtimeType==int) return await instance.setInt(key,value);
    else if(T.runtimeType==double) return await instance.setDouble(key,value);
    else if(T.runtimeType==List) return await instance.setStringList(key,value);
    else return null;
  }
}
