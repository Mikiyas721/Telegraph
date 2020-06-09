import 'dart:math';
import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:Telegraph/core/utils/smsHandler.dart';
import 'package:Telegraph/data/http.dart';
import 'package:Telegraph/data/userDataSource.dart';
import 'package:Telegraph/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:validators/validators.dart';

class UserBloc extends Disposable {
  UserRepo userRepo = GetIt.instance.get();
  String verificationNumber;

  String validatePhoneNumber(dynamic number) {
    if (number == null) return null;
    if (number.phoneNumber.length < 9 ||
        number.phoneNumber.length > 10 ||
        !isNumeric(number.phoneNumber))
      return 'Invalid Phone Number';
    else
      return null;
  }

  sendSms(String phoneNumber) async {
    verificationNumber = (Random().nextInt(9000) + 1000).toString();
    print(verificationNumber);
    final smsHandler = SMSHandler(
            to: phoneNumber,
            messageBody: 'Your verification code is: $verificationNumber')
        .create();
  }

  String validateCode(dynamic code) =>
      verificationNumber == code ? null : "Incorrect Code";

  setIsLoggedIn() => userRepo.setPreference(PreferenceKeys.isLoggedIn, true);

  Future<bool> addNewUser(UserModel newUser) async {
    Response response = await userRepo.addUser(newUser);
    if (response.statusCode == 200) return true;
    return false;
  }

  Future<bool> isUserNew() async {
    dynamic user =
        await Http.getUserByNumber(userRepo.dataStream.value.getPhoneNumber);
    return user == null ? true : false;
  }

  @override
  void dispose() {}
}
