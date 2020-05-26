import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHandler {
  SharedPreferenceHandler._privateConstructor();

  static final SharedPreferenceHandler _instance =
      SharedPreferenceHandler._privateConstructor();

  static SharedPreferenceHandler getInstance() => _instance;

  Future<SharedPreferences> _setInstance() async {
    SharedPreferences _instance = await SharedPreferences.getInstance();
    return _instance;
  }

  /// Notification
  /// Message
  Future<bool> setMessageAlert(bool messageAlert) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('MessageAlert', messageAlert);
  }

  Future<bool> getMessageAlert() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('MessageAlert');
  }

  Future<bool> setMessagePreview(bool messagePreview) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('MessagePreview', messagePreview);
  }

  Future<bool> getMessagePreview() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('MessagePreview');
  }

  Future<bool> setMessageVibrate(String messageVibrate) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('MessageVibrate', messageVibrate);
  }

  Future<String> getMessageVibrate() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('MessageVibrate');
  }

  Future<bool> setMessagePopup(String messagePopup) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('MessagePopup', messagePopup);
  }

  Future<String> getMessagePopup() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('MessagePopup');
  }

  Future<bool> setMessageSound(String messageSound) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('MessageSound', messageSound);
  }

  Future<String> getMessageSound() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('MessageSound');
  }

  Future<bool> setMessagePriority(String messagePriority) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('MessagePriority', messagePriority);
  }

  Future<String> getMessagePriority() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('MessagePriority');
  }

  ///Group
  Future<bool> setGroupAlert(bool groupAlert) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('GroupAlert', groupAlert);
  }

  Future<bool> getGroupAlert() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('GroupAlert');
  }

  Future<bool> setGroupPreview(bool groupPreview) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('GroupPreview', groupPreview);
  }

  Future<bool> getGroupPreview() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('GroupPreview');
  }

  Future<bool> setGroupVibrate(String groupVibrate) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('GroupVibrate', groupVibrate);
  }

  Future<String> getGroupVibrate() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('GroupVibrate');
  }

  Future<bool> setGroupPopup(String groupPopup) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('GroupPopup', groupPopup);
  }

  Future<String> getGroupPopup() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('GroupPopup');
  }

  Future<bool> setGroupSound(String groupSound) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('GroupSound', groupSound);
  }

  Future<String> getGroupSound() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('GroupSound');
  }

  Future<bool> setGroupPriority(String groupPriority) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('GroupPriority', groupPriority);
  }

  Future<String> getGroupPriority() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('GroupPriority');
  }

  ///In-App
  Future<bool> setInAppSound(bool inAppSound) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InAppSound', inAppSound);
  }

  Future<bool> getInAppSound() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('InAppSound');
  }

  Future<bool> setInAppVibrate(bool inAppVibrate) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InAppVibrate', inAppVibrate);
  }

  Future<bool> getInAppVibrate() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('InAppVibrate');
  }

  Future<bool> setInAppPreview(bool inAppPreview) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InAppPreview', inAppPreview);
  }

  Future<bool> getInAppPreview() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('InAppPreview');
  }

  Future<bool> setInChatSound(bool inChatSound) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InChatSound', inChatSound);
  }

  Future<bool> getInChatSound() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('InChatSound');
  }

  Future<bool> setInAppPriority(bool inAppPriority) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InAppPriority', inAppPriority);
  }

  Future<bool> getInAppPriority() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('InAppPriority');
  }

  ///Security
  Future<bool> setWhoViewLastSeen(String whoViewLastSeen) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('WhoViewLastSeen', whoViewLastSeen);
  }

  Future<String> getWhoViewLastSeen() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('WhoViewLastSeen');
  }

  Future<bool> setWhoCanCallMe(String whoCanCallMe) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('WhoCanCallMe', whoCanCallMe);
  }

  Future<String> getWhoCanCallMe() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('WhoCanCallMe');
  }

  Future<bool> setUserPassword(int newPassword) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setInt("UserPassword", newPassword);
  }

  Future<int> getUserPassword() async {
    SharedPreferences instance = await _setInstance();
    return instance.getInt("UserPassword");
  }

  /// Data and Storage
  Future<bool> setMediaDownloadOnData(String onMobileData) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('MediaDownloadOnMobileData', onMobileData);
  }

  Future<String> getMediaDownloadOnData() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('MediaDownloadOnMobileData');
  }

  Future<bool> setMediaDownloadOnWifi(String onMobileData) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('MediaDownloadOnWifi', onMobileData);
  }

  Future<String> getMediaDownloadOnWifi() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('MediaDownloadOnWifi');
  }

  /// ChatBackground
  Future<bool> setChatBackground(String selectedImage) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('ChatBackground', selectedImage);
  }

  Future<String> getChatBackground() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('ChatBackground');
  }

  /// Theme
  Future<bool> setSelectedTheme(String selectedTheme) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString("SelectedTheme", selectedTheme);
  }

  Future<String> getSelectedTheme() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('SelectedTheme');
  }

  /// Language

  Future<bool> setAppLanguage(String selectedLanguage) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setString('Language', selectedLanguage);
  }

  Future<String> getAppLanguage() async {
    SharedPreferences instance = await _setInstance();
    return instance.getString('Language');
  }

  /// Others
  Future<bool> setEnableAnimation(bool enableAnimation) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('EnableAnimation', enableAnimation);
  }

  Future<bool> isAnimationEnabled() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('EnableAnimation');
  }

  Future<bool> setInAppBrowser(bool inAppBrowser) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InAppBrowser', inAppBrowser);
  }

  Future<bool> isInAppBrowser() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('InAppBrowser');
  }

  Future<bool> setDirectShare(bool directShare) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('DirectShare', directShare);
  }

  Future<bool> isDirectShare() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('DirectShare');
  }

  Future<bool> setMessageTextSize(int size) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setInt('MessageTextSize', size);
  }

  Future<int> getMessageTextSize() async {
    SharedPreferences instance = await _setInstance();
    return instance.getInt('MessageTextSize');
  }

  Future<bool> setRaiseToSpeak(bool raiseToSpeak) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('RaiseToSpeak', raiseToSpeak);
  }

  Future<bool> getRaiseToSpeak() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('RaiseToSpeak');
  }

  Future<bool> setSendByEnter(bool sendByEnter) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('SendByEnter', sendByEnter);
  }

  Future<bool> getSendByEnter() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('SendByEnter');
  }

  Future<bool> setSaveToGallery(bool saveToGallery) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('SaveToGallery', saveToGallery);
  }

  Future<bool> getSaveToGallery() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('SaveToGallery');
  }

  Future<bool> setAutoPlayGIF(bool autoPlayGIF) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('AutoPlayGIF', autoPlayGIF);
  }

  Future<bool> getAutoPlayGIF() async {
    SharedPreferences instance = await _setInstance();
    return instance.getBool('AutoPlayGIF');
  }
}
