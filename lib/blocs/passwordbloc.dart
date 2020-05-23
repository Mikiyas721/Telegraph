import 'dart:async';

import 'package:Telegraph/blocs/passwordProvider.dart';
import 'package:Telegraph/others/sharedPreferenceHandler.dart';
import 'package:rxdart/rxdart.dart';

class PasswordBloc implements Disposable {
  final passwordStream = BehaviorSubject();

  Stream<String> get passwordErrorStream {
    return passwordStream.map(validatePassword);
  }

  String validatePassword(String password) {
    return password.length == 4 ? null : 'Password has to be 4 digits long';
  }

  Function(String password) get addPassword => passwordStream.add;

  bool save() {
    final password = passwordStream.value;
    if (validatePassword(password) == null) {
      SharedPreferenceHandler.getInstance().setUserPassword(password);
      return true;
    }
    return false;
  }

  dispose() {
    passwordStream.close();
  }
}
