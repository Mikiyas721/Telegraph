import 'package:Telegraph/core/utils/disposable.dart';
import 'package:Telegraph/data/passwordDataSource.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:Telegraph/models/password.dart';
import 'package:Telegraph/core/utils/preferenceKeys.dart';
import 'package:toast/toast.dart';

class PasswordBloc extends Disposable {
  PasswordRepo passwordRepo = GetIt.instance.get();

  Stream<String> get passwordErrorStream {
    return passwordRepo.getStream<String>((password) => validatePassword(password.password));
  }
  Stream<String> get passwordCheck {
    return passwordRepo.getStream<String>((password) => checkPassword(password.password));
  }
  bool savePassword() {
    final password = passwordRepo.passwordSubject.value.password;
    if (validatePassword(password) == null) {
      passwordRepo.setPreference<int>(
          PreferenceKeys.userPassword, int.parse(password));
      return true;
    }
    return false;
  }
  checkPassword(password){
    return passwordRepo.getPreference<int>(PreferenceKeys.userPassword).toString()!=password
        ? 'Invalid Password'
        : null;
  }
  onPasswordEntered(String password, BuildContext context){
    if(checkPassword(password)==null) Navigator.pushReplacementNamed(context, '/homePage');
    else Toast.show('Incorrect Password', context);
  }

  String validatePassword(String password) {
    return password.length >= 4 ? null : 'Password has to be 4 digits long';
  }

  onLockUnlock(bool wasLocked) {
    passwordRepo.updateStream(PasswordModel(
        password: passwordRepo.subjectValue == null
            ? null
            : passwordRepo.subjectValue.password,
        isLocked: !wasLocked));
    passwordRepo.setPreference<bool>(PreferenceKeys.isLocked, !wasLocked);
  }

  @override
  void dispose() {}
}
