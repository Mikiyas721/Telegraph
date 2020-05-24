import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHandler {
  SharedPreferenceHandler._privateConstructor();

  static final SharedPreferenceHandler _instance =
      SharedPreferenceHandler._privateConstructor();

  static SharedPreferenceHandler getInstance() => _instance;

  _setInstance() async {
    SharedPreferences _instance = await SharedPreferences.getInstance();
    return _instance;
  }

  Future<bool> setUserPassword(int newPassword) async {
    SharedPreferences instance = await _setInstance();
    return await instance.setInt("UserPassword", newPassword);
  }

  int getUserPassword() {
    SharedPreferences instance = _setInstance();
    return instance.getInt("UserPassword");
  }

  Future<bool> setChatBackground(String selectedImage)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setString('ChatBackground', selectedImage);
  }

  String getChatBackground(){
    SharedPreferences instance = _setInstance();
    return instance.getString('ChatBackground');
  }

  Future<bool> setAppLanguage(String selectedLanguage)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setString('Language', selectedLanguage);
  }

  String getAppLanguage(){
    SharedPreferences instance = _setInstance();
    return instance.getString('Language');
  }

  Future<bool> setEnableAnimation(bool enableAnimation)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('EnableAnimation', enableAnimation);
  }

  bool isAnimationEnabled(){
    SharedPreferences instance = _setInstance();
    return instance.getBool('EnableAnimation');
  }

  Future<bool> setInAppBrowser(bool inAppBrowser)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('InAppBrowser', inAppBrowser);
  }

  bool isInAppBrowser(){
    SharedPreferences instance = _setInstance();
    return instance.getBool('InAppBrowser');
  }

  Future<bool> setMessageTextSize(int size)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setInt('MessageTextSize', size);
  }

  int getMessageTextSize(){
    SharedPreferences instance = _setInstance();
    return instance.getInt('MessageTextSize');
  }

  Future<bool> setRaiseToSpeak(bool inAppBrowser)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('RaiseToSpeak', inAppBrowser);
  }

  bool getRaiseToSpeak(){
    SharedPreferences instance = _setInstance();
    return instance.getBool('RaiseToSpeak');
  }

  Future<bool> setSendByEnter(bool inAppBrowser)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('SendByEnter', inAppBrowser);
  }

  bool getSendByEnter(){
    SharedPreferences instance = _setInstance();
    return instance.getBool('SendByEnter');
  }

  Future<bool> setSaveToGallery(bool inAppBrowser)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('SaveToGallery', inAppBrowser);
  }

  bool getSaveToGallery(){
    SharedPreferences instance = _setInstance();
    return instance.getBool('SaveToGallery');
  }

  Future<bool> setAutoPlayGIF(bool autoPlayGIF)async{
    SharedPreferences instance = await _setInstance();
    return await instance.setBool('AutoPlayGIF', autoPlayGIF);
  }

  bool getAutoPlayGIF(){
    SharedPreferences instance = _setInstance();
    return instance.getBool('AutoPlayGIF');
  }
}
