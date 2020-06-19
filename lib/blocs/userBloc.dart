import 'dart:math';
import '../core/utils/disposable.dart';
import '../core/utils/preferenceKeys.dart';
import '../core/utils/smsHandler.dart';
import '../data/userDataSource.dart';
import '../models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:validators/validators.dart';
import 'package:toast/toast.dart';

class UserBloc extends Disposable {
  UserRepo userRepo = GetIt.instance.get();
  String verificationNumber;

  String validatePhoneNumber(dynamic number) {
    if (number == null) return null;
    if (number.getPhoneNumber.length < 9 ||
        number.getPhoneNumber.length > 10 ||
        (number.getPhoneNumber.startsWith('0') &&
            number.getPhoneNumber != 10) ||
        !isNumeric(number.getPhoneNumber))
      return 'Invalid Phone Number';
    else
      return null;
  }

  verifyCode(String enteredCode, BuildContext context) async {
    if (enteredCode == verificationNumber) {
      if (await isUserNew(context)) {
        Navigator.pushReplacementNamed(context, '/userInformationPage');
      } else {
        setIsLoggedIn();
        Navigator.pushNamedAndRemoveUntil(
            context, '/homePage', (Route<dynamic> route) => false);
      }
    }
  }

  sendSms() async {
    verificationNumber = (Random().nextInt(9000) + 1000).toString();
    print(verificationNumber);
    final smsHandler = SMSHandler(
            to: userRepo.dataStream.value.getPhoneNumberString(),
            messageBody: 'Your verification code is: $verificationNumber')
        .create();
  }

  String validateCode(dynamic code) =>
      verificationNumber == code ? null : "Incorrect Code";

  setIsLoggedIn() =>
      userRepo.setPreference<bool>(PreferenceKeys.isLoggedIn, true);

  Future<bool> addNewUser(UserModel newUser) async {
    Response response = await userRepo.addNewUser(newUser);
    if (response.statusCode == 200) return true;
    return false;
  }
  Future<bool> addNewAccount(UserModel newUser) async {
    Response response = await userRepo.addNewUser(newUser);
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<bool> isUserNew(BuildContext context) async {
    UserModel userModel = userRepo.subjectValue;
    try {
      dynamic user =
          await userRepo.getUserByNumber('${userModel.getPhoneNumberString()}');
      return user == null ? true : false;
    } catch (SocketException) {
      Toast.show('Unable to connect', context);
    }
  }

  Future<bool> saveUserAPIId() async {
    UserModel userModel = userRepo.subjectValue;
    Map<String, dynamic> user =
        await userRepo.getUserByNumber(userModel.getPhoneNumberString());
    if (user != null) {
      return await userRepo.setPreference<String>(
          PreferenceKeys.userAPIId, user['id']);
    }
    return false;
  }

  onSubmitClicked(BuildContext context) async {
    UserModel userModel = userRepo.subjectValue;
    if (userModel.getFirstName != null) {
      bool isAdded = await addNewUser(UserModel(
          firstName: userModel.getFirstName,
          lastName: userModel.getLastName,
          phone: userModel.getPhoneNumber,
          countryCode: userModel.getCountryCode,
          lastSeen: DateTime.now()));
      if (isAdded) {
        if (await saveUserAPIId()) {
          setUpDefaults();
          setIsLoggedIn();
          Navigator.pushNamedAndRemoveUntil(
              context, '/homePage', (Route<dynamic> route) => false);
        } else {
          Toast.show('User not saved. Please Try Again', context,
              gravity: Toast.CENTER);
        }
      } else {
        Toast.show('Unable to finish process', context, gravity: Toast.CENTER);
      }
    } else {
      Toast.show('Please enter your first name', context);
    }
  }

  updateName(String newValue, bool isFirstName, bool isUserInfo) {
    UserModel previous = userRepo.dataStream.value;
    if (isFirstName) {
      userRepo.updateStream(UserModel(
          firstName: newValue,
          lastName: previous.getLastName,
          countryCode: previous.getCountryCode,
          phone: previous.getPhoneNumber));
    } else {
      userRepo.updateStream(UserModel(
          firstName: previous.getFirstName,
          lastName: newValue,
          countryCode: previous.getCountryCode,
          phone: previous.getPhoneNumber));
    }
  }

  onNumberEntered(BuildContext context) {
    if (validatePhoneNumber(userRepo.dataStream.value) == null) {
      Navigator.pushReplacementNamed(context, '/phoneVerificationPage');
    } else {
      Toast.show("Invalid Phone Number", context);
    }
  }

  void setUpDefaults() {
    userRepo.setPreference<bool>(PreferenceKeys.messageAlert, true);
    userRepo.setPreference<bool>(PreferenceKeys.messagePreview, false);
    userRepo.setPreference<String>(PreferenceKeys.messageVibrate, "Default");
    userRepo.setPreference<String>(PreferenceKeys.messagePopup, "No popup");
    userRepo.setPreference<String>(PreferenceKeys.messageSound, "No popup");
    userRepo.setPreference<String>(PreferenceKeys.messagePriority, "Default");

    userRepo.setPreference<bool>(PreferenceKeys.groupAlert, false);
    userRepo.setPreference<bool>(PreferenceKeys.groupPreview, true);
    userRepo.setPreference<String>(PreferenceKeys.groupVibrate, "Default");
    userRepo.setPreference<String>(PreferenceKeys.groupPopup, "No popup");
    userRepo.setPreference<String>(PreferenceKeys.groupSound, "No popup");
    userRepo.setPreference<String>(PreferenceKeys.groupPriority, "Default");

    userRepo.setPreference<bool>(PreferenceKeys.inAppSound, false);
    userRepo.setPreference<bool>(PreferenceKeys.inAppVibrate, true);
    userRepo.setPreference<bool>(PreferenceKeys.inAppPreview, true);
    userRepo.setPreference<bool>(PreferenceKeys.inChatSound, false);
    userRepo.setPreference<bool>(PreferenceKeys.inAppPriority, false);

    userRepo.setPreference<String>(
        PreferenceKeys.whoViewLastSeen, "My Contacts");
    userRepo.setPreference<String>(PreferenceKeys.whoCanCallMe, "My Contacts");

    userRepo.setPreference<String>(PreferenceKeys.onMobileData, "No Media");
    userRepo.setPreference<String>(PreferenceKeys.onWifi, "No Media");

    userRepo.setPreference<String>(
        PreferenceKeys.chatBackground, "assets/chatBackground_8.jpeg");

    userRepo.setPreference<String>(
        PreferenceKeys.selectedTheme, "DefaultLight");

    userRepo.setPreference<String>(PreferenceKeys.selectedTheme, "English");

    userRepo.setPreference<bool>(PreferenceKeys.enableAnimation, true);
    userRepo.setPreference<bool>(PreferenceKeys.inAppBrowser, false);
    userRepo.setPreference<bool>(PreferenceKeys.directShare, true);
    userRepo.setPreference<int>(PreferenceKeys.messageTextSize, 12);
    userRepo.setPreference<bool>(PreferenceKeys.raiseToSpeak, false);
    userRepo.setPreference<bool>(PreferenceKeys.sendByEnter, true);
    userRepo.setPreference<bool>(PreferenceKeys.autoPlayGIF, false);
    userRepo.setPreference<bool>(PreferenceKeys.saveToGallery, false);

    userRepo.setPreference<bool>(PreferenceKeys.isLocked, false);
  }

  @override
  void dispose() {}
}
